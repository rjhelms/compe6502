.PC02

.include "asminc/zeropage.inc"
.include "asminc/slot_defs.inc"

.export IO_VIA_START    = SLOT0
.export IO_VIA_PORTB    = IO_VIA_START + $00
.export IO_VIA_PORTA    = IO_VIA_START + $01
.export IO_VIA_DDRB     = IO_VIA_START + $02
.export IO_VIA_DDRA     = IO_VIA_START + $03
.export IO_VIA_T1CL     = IO_VIA_START + $04
.export IO_VIA_T1CH     = IO_VIA_START + $05
.export IO_VIA_T1LL     = IO_VIA_START + $06
.export IO_VIA_T1LH     = IO_VIA_START + $07
.export IO_VIA_T2CL     = IO_VIA_START + $08
.export IO_VIA_T2CH     = IO_VIA_START + $09
.export IO_VIA_SR       = IO_VIA_START + $0A
.export IO_VIA_ACR      = IO_VIA_START + $0B
.export IO_VIA_PCR      = IO_VIA_START + $0C
.export IO_VIA_IFR      = IO_VIA_START + $0D
.export IO_VIA_IER      = IO_VIA_START + $0E
.export IO_VIA_PORTA_NH = IO_VIA_START + $0F

.export IO_MASK_SD_MISO         = %00000001
.export IO_MASK_SD_MOSI         = %00000010
.export IO_MASK_SD_SCK          = %00000100
.export IO_MASK_SD_CS           = %00001000
.export IO_MASK_KBD_REPT        = %00010000
.export IO_MASK_SPKR            = %00100000
.export IO_MASK_CAS_TX          = %01000000
.export IO_MASK_CAS_RX          = %10000000

.export IO_PCR_CA2_HANDSHAKE    = %00001000

.segment "SD_WORK"

.export LOAD_PAGE               = $0400

.segment "SYS"

.export IO_INIT, KEY_GET, KEY_READ, BEEP, CLOAD, CSAVE, CPUTBYTE, CGETBYTE
.export CLEADER

.import SHWMSG, PRBYTE
.import COUT

.proc IO_INIT
        pha

        ; initialize port A
        lda #$00        
        sta IO_VIA_DDRA
        lda #IO_PCR_CA2_HANDSHAKE
        sta IO_VIA_PCR

        ; initialize port B
        lda #$00
        sta IO_VIA_PORTB
        lda #IO_MASK_KBD_REPT | IO_MASK_SPKR | IO_MASK_CAS_TX
        sta IO_VIA_DDRB

        pla
        rts
.endproc

; KEY_GET
; blocking keyboard read - idles until a key is pressed

.proc KEY_GET
        lda IO_VIA_IFR
        and #%00000010
        beq KEY_GET
        lda IO_VIA_PORTA
        rts
.endproc

; KEY_READ
; non-blocking keyboard read - returns $00 if no new keypress

.proc KEY_READ
        lda IO_VIA_IFR
        and #%00000010
        bne BYTE_AVAIL
        lda #$00
        rts
BYTE_AVAIL:
        lda IO_VIA_PORTA
        rts
.endproc

.proc BEEP
        pha
        phy
        phx
        ldx #$20
@CYCLE: lda IO_VIA_PORTB        ; 3
        eor #IO_MASK_SPKR       ; 2
        sta IO_VIA_PORTB        ; 4
        jsr @DELAY              ; 6
        dex                     ; 2
        bne @CYCLE              ; 3
        plx
        ply
        pla
        rts       
@DELAY:
        ldy #$66                ; 3
@D_LOOP:
        dey                     ; 2
        bne @D_LOOP             ; 3
        rts                     ; 6
.endproc

; CLOAD
;
; load a file from cassette
; uses STL/STH for start/current address, L/H for end address

.proc   CLOAD
        lda     #$0A
        jsr     COUT
        lda     #<MSG_PRESS_PLAY        ; display press play message
        sta     MSGL
        lda     #>MSG_PRESS_PLAY
        sta     MSGH
        jsr     SHWMSG
        lda     #$00                    ; zero out checksum
        sta     CRC

header:
        lda     #$09                    ; header starts with count down from
        sta     STL                     ; $09
count_in:
        jsr     CGETBYTE                ; get the byte
        cmp     STL                     ; compare with expected
        bne     count_in                ; if not - maybe just a stray byte on
                                        ; tape start?

        clc                             ; add to checksum
        adc     CRC
        sta     CRC

        dec     STL                     ; decrement expected byte

        bpl     count_in                ; keep going 'til expected wraps around
                                        ; to $FF


        ldy     #$00

get_name:                               ; load 8-byte file name
        jsr     CGETBYTE                ; get byte from cassette
        sta     LOAD_PAGE, Y            ; store in LOAD_PAGE

        clc                             ; add to checksum
        adc     CRC
        sta     CRC

        iny                             ; keep going until we have 8 bytes
        cpy     #$08
        bne     get_name
        lda     #$00                    ; write $00 after the file name 
        sta     LOAD_PAGE, Y

        ldy     #$00

get_addr:
        jsr     CGETBYTE                ; get the start and end addresses
        pha                             ; push low byte of start address to
                                        ;       stack
        sta     STL                     ; and stash on zero page
        clc
        adc     CRC                     ; I bet this could be a loop as all
        sta     CRC                     ; 4 variables are sequential

        jsr     CGETBYTE
        pha                             ; push high byte of start address to
                                        ;       stack
        sta     STH
        clc
        adc     CRC
        sta     CRC

        jsr     CGETBYTE
        sta     L
        clc
        adc     CRC
        sta     CRC

        jsr     CGETBYTE
        sta     H
        clc
        adc     CRC
        sta     CRC

checksum:
        jsr     CGETBYTE                ; get and validate the checksum
        cmp     CRC
        bne     header_checksum_bad
header_checksum_good:
        lda     #<MSG_HEADER_FOUND
        sta     MSGL
        lda     #>MSG_HEADER_FOUND
        sta     MSGH
        jmp     header_end
header_checksum_bad:
        lda     #<MSG_CHECKSUM_FAIL
        sta     MSGL
        lda     #>MSG_CHECKSUM_FAIL
        sta     MSGH
        jsr     SHWMSG
        rts

header_end:
        jsr     SHWMSG                  ; output the details from the header
        lda     #<LOAD_PAGE             ; file name
        sta     MSGL
        lda     #>LOAD_PAGE
        sta     MSGH
        jsr     SHWMSG
        lda     #$0A
        jsr     COUT
        lda     STH                     ; start address
        jsr     PRBYTE
        lda     STL
        jsr     PRBYTE
        lda     #':'
        jsr     COUT
        lda     H                       ; end address
        jsr     PRBYTE
        lda     L
        jsr     PRBYTE
        lda     #$0A
        jsr     COUT
        ldy     #$00
        sty     CRC
read_data:
        jsr     CGETBYTE                ; get a byte

        sta     (STL), Y                ; store it in memory
        clc
        adc     CRC                     ; add to checksum
        sta     CRC

        iny                             ; increment Y
        bne     :+                      ; if it's wrapped, increment the high
        inc     STH                     ; address

                                        ; and get a block checksum
        jsr     CGETBYTE
        cmp     CRC
        bne     data_checksum_bad
        
:       cpy     L                       ; check if we're done - compare low byte
        bne     read_data
        lda     STH                     ; if it matches, compare high byte
        cmp     H
        bne     read_data

done:
        jsr     CGETBYTE                ; get and validate the checksum
        cmp     CRC
        bne     data_checksum_bad
data_checksum_good:
        lda     #<MSG_CHECKSUM_OK
        sta     MSGL
        lda     #>MSG_CHECKSUM_OK
        sta     MSGH
        jmp     end
data_checksum_bad:
        lda     #<MSG_CHECKSUM_FAIL
        sta     MSGL
        lda     #>MSG_CHECKSUM_FAIL
        sta     MSGH

end:
        pla                             ; recover STL/STH values from stack
        sta     STH
        pla
        sta     STL
        jsr     SHWMSG
        rts
.endproc


; CSAVE
;
; saves a programme to casette
; uses STL/STH for start/current address, L/H for end address

.proc CSAVE
        lda     IO_VIA_PORTB            ; ensure TX is high
        ora     #IO_MASK_CAS_TX
        sta     IO_VIA_PORTB
        lda     #$0A
        jsr     COUT
        lda     #<MSG_PRESS_RECORD      ; display press record message
        sta     MSGL
        lda     #>MSG_PRESS_RECORD
        sta     MSGH

        jsr     SHWMSG

ret_wait:
        jsr     KEY_GET              ; wait for key press
        cmp     #$0D
        bne     ret_wait

        lda     #$00                    ; zero out checksum
        sta     CRC

in_leader:                              ; record 5 second leader
        lda     #$32
        jsr     CLEADER

header:                                 ; write header
        lda     #$09
count_in:                               ; count down from $09 to 00
        jsr     CPUTBYTE                ; write byte to cassette

        tay
        clc                             ; add to checksum
        adc     CRC
        sta     CRC
        tya

        dec                             ; decrement count
        bpl     count_in                ; keep going until wrapped around

        ldy     #$00
store_name:                             ; write 8-byte file name
        lda     LOAD_PAGE, Y            ; load name from LOAD_PAGE
        jsr     CPUTBYTE                ; write to cassette

        clc                             ; add to checksum
        adc     CRC
        sta     CRC

        iny                             ; keep going until written 8 bytes
        cpy     #$08
        bne     store_name

        ldy     #$00
store_addr:
        lda     STL
        jsr     CPUTBYTE
        clc
        adc     CRC
        sta     CRC

        lda     STH
        jsr     CPUTBYTE
        clc
        adc     CRC
        sta     CRC

        lda     L
        jsr     CPUTBYTE
        clc
        adc     CRC
        sta     CRC

        lda     H
        jsr     CPUTBYTE
        clc
        adc     CRC
        sta     CRC

checksum:
        lda     CRC
        jsr     CPUTBYTE

        lda     #$0A                    ; 1 second leader
        jsr     CLEADER

        ldy     #$00                    ; zero out checksum for data write
        sty     CRC

write_data:
        lda     (STL), Y                ; get a byte
        jsr     CPUTBYTE
        clc
        adc     CRC
        sta     CRC

        iny                             ; increment Y
        bne     :+                      
        
        inc     STH                     ; if wrapped, increment high address
        lda     #$01                    ; and write a checksum block
        jsr     CLEADER                 ; 0.1 sec leader
        lda     CRC
        jsr     CPUTBYTE                ; checksum byte
        lda     #$01                    ; 0.1 sec leader
        jsr     CLEADER

:       cpy     L                       ; check if we're done - compare low byte
        bne     write_data
        lda     STH                     ; if it matches, compare high byte
        cmp     H
        bne     write_data

done:                                   ; fallen through both checks, we're done
        lda     CRC                     ; write the final checksum
        jsr     CPUTBYTE
out_leader:                             ; record 5 second leader
        lda     #$32
        jsr     CLEADER
        lda     #<MSG_SAVE_COMPLETE     ; display save complete message
        sta     MSGL
        lda     #>MSG_SAVE_COMPLETE
        sta     MSGH
        jsr     SHWMSG
        rts
.endproc

; CPUTBYTE
; 
; outputs byte in A register to cassette port

.proc CPUTBYTE
        phy                     ; stash A & Y regs
        pha
        ; initialize IO port for output
        ldy     IO_VIA_PORTB    ; stash existing PORTB state
        phy
        ldy     IO_VIA_DDRB
        phy

        ldy     #IO_MASK_CAS_TX
        sty     IO_VIA_PORTB
        sty     IO_VIA_DDRB

        ldy     #$07            ; init loop counter
        sty     IO_VIA_PORTB    ; send start bit

        ror                     ; shift right two times - move bit 0 to bit 7
        ror                     ; gets shifted one more time (to bit 6) below
@again:
        jsr     CWAIT           ; wait for byte
        ror                     ; rotate right (move up to next bit)
        sta     IO_VIA_PORTB    ; write to VIA
        dey
        bpl     @again          ; keep going

        jsr     CWAIT           ; wait for final bit to send
        sty     IO_VIA_PORTB    ; sent stop bit (Y has $FF)
        jsr     CWAIT           ; wait for two stop bits
        jsr     CWAIT
        
        ply                     ; pull DDRB and PORTB off the stack
        sty     IO_VIA_DDRB     ; and restore
        ply
        sty     IO_VIA_PORTB
        pla                     ; restore A & Y regs
        ply
        rts
.endproc

; CGETBYTE
; 
; reads byte from the cassette port to the A register
; assumes IO port is in a valid state

.proc CGETBYTE
        phy
        ldy     #$08            ; init load counter
start:
        bit     IO_VIA_PORTB    ; wait for start bit - 1 > 0 transition
        bmi     start
        jsr     CHALFWAIT       ; wait half a byte's time, to be sampling in
                                ; the center
input:
        jsr     CWAIT           ; full wait time between samples
        asl     IO_VIA_PORTB    ; shift bit 7 (cassette RX) into carry
        ror                     ; ... then into the accumulator
        dey
        bne     input           ; keep going if not at bit 0
        ply
        beq     CWAIT           ; else, use WAIT to get into the stop bit
.endproc

; CWAIT
;
; 300 baud waiting time

CWAIT:
        jsr     CHALFWAIT       ; do half a wait, then fall through for the
                                ; 2nd healf

CHALFWAIT:                      ; half the waiting time
        phy                     ; save Y
        ldy     #$48            ; first part - 72 x 5us
CWAIT1:
        dey
        bne     CWAIT1
CWAIT2:
        dey                     ; Y was 0 on entry, so 255 x 5us for 2nd part
        bne     CWAIT2 
        ply                     ; retrieve Y
        rts

; CLEADER
;
; writes a leader for the length specified in the accumulator
; length defined in tenths of seconds (approximately)

.proc CLEADER
        phx                     ; stash X and A registers
        pha
        lda     IO_VIA_PORTB    ; ensure TX is high
        ora     #IO_MASK_CAS_TX
        sta     IO_VIA_PORTB
        pla
loop1:                          ; outer loop - 1/10th of second
        ldx     #$1E            ; 30 byte periods

loop2:                          ; inner loop - 1 byte period
        jsr     CWAIT
        dex
        cpx     #$00
        bne     loop2

        dec
        cmp     #$00
        bne     loop1
done:
        plx                     ; restore X register
        rts                     ; and return
.endproc

.SEGMENT "RODATA"
MSG_PRESS_PLAY:
        .byte "Press play on cassette.", $0A, $00
MSG_PRESS_RECORD:
        .byte "Press record on cassette", $0A, "and hit enter.", $0A, $00
MSG_HEADER_FOUND:
        .byte "Loading ", $00
MSG_CHECKSUM_OK:
        .byte "Checksum OK", $0A, $00
MSG_CHECKSUM_FAIL:
        .byte "Checksum fail", $0A, $00
MSG_SAVE_COMPLETE:
        .byte "Save complete", $0A, $00
