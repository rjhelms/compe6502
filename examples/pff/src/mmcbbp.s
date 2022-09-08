.PC02

.macro print_a
    pha
    pha
    lda #$D0
    sta $B801
    pla
    sta $B801
    lda #$D6
    sta $B801
    pla
.endmacro

.macro print addr
    lda #$D0
    sta $B801
    lda addr
    sta $B801
    lda #$D6
    sta $B801
.endmacro

.macro print_zpy addr
    lda #$D0
    sta $B801
    lda (addr),y
    sta $B801
    lda #$D6
    sta $B801
.endmacro

; IO definitions
IO_VIA_PORTB    = $8000
IO_VIA_DDRB     = $8002
SD_MISO         = %00000001
SD_MOSI         = %00000010
SD_SCK          = %00000100
SD_CS           = %00001000

; Command definitions
CMD0    = ($40 + 0)     ; GO_IDLE_STATE
CMD1    = ($40 + 1)     ; SEND_OP_COND (MMC)
ACMD41  = ($C0 + 41)    ; SEND_OP_COND (SDC)
CMD8    = ($40 + 8)     ; SEND_IF_COND
CMD16   = ($40 + 16)    ; SET_BLOCKLEN
CMD17   = ($40 + 17)    ; READ_SINGLE_BLOCK
CMD24   = ($40 + 24)    ; WRITE_BLOCK
CMD55   = ($40 + 55)    ; APP_CMD
CMD58   = ($40 + 58)    ; READ_OCR

; card type flags
CT_MMC      = $01               ; MMC ver 2
CT_SD1      = $02               ; SD ver 1
CT_SD2      = $03               ; SD ver 2
CT_SDC      = (CT_SD1 | CT_SD2) ; SD
CT_BLOCK    = $08               ; block addressing

; DSTATUS flags
STA_NOINIT  = $01   ; disk not initialized
STA_NODISK  = $02   ; disk no present

; DRESULT flags
RES_OK      = 0     ; 0: Function succeeded
RES_ERROR   = 1     ; 1: Disk error
RES_NOTRDY  = 2     ; 2: Not ready
RES_PARERR  = 3     ; 3: Invalid parameter

_buff       = $0400             ; SD buffer location

.macpack longbranch

.global _sector
.global _offset
.global _count
.global _result

.export _disk_initialize
.export _disk_readp

.segment "ZEROPAGE"
    __buff: .res 2

.segment "BSS"
    _sector: .res 4, $00
    _offset: .res 2, $00
    _count: .res 2, $00
    _result: .res 1, $00
    _CardType: .res 1, $00
    _cmd: .res 1, $00
    _arg: .res 4, $00
    _tmp_cmd: .res 1, $00
    _tmp_arg: .res 4, $00
    _data_byte: .res 1, $00
    _tmr: .res 2, $00

.segment "CODE"

; unsigned char disk_initialize();
; initialize disk drive

.proc _disk_initialize
    jsr _init_port      ; init port and send 10 dummy bytes
    lda IO_VIA_PORTB
    ora #SD_CS
    sta IO_VIA_PORTB
    lda #$00
    sta _tmr+1
    lda #$0A
    sta _tmr
    jsr _skip_mmc


    lda #$00            ; clear any existing card type
    sta _CardType

    ldx #$20            ; send CMD0 up to 32 times?

@check_cmd0:
    lda #CMD0           ; send CMD0(0)
    sta _cmd
    stz _arg
    stz _arg+1
    stz _arg+2
    stz _arg+3

    phx
    jsr _send_cmd
    plx

    cmp #$01            ; expecting 1 back
    beq :+              ; move on if we got it
    dex
    jeq @return
    jmp @check_cmd0

:   lda #CMD8           ; send CMD8(1AA)
    sta _cmd

    lda #$AA            ; (arg+2 and +3 should have 00 still)
    sta _arg
    lda #$01
    sta _arg+1

    jsr _send_cmd
    cmp #$01            ; 1 back means this is an SDv2 card
    jne @SDv1           ; else proceed w/ init for SDv1

@SDv2:
    ldx #$00            ; write 4 byte response to buffer
:   jsr _rcvr_mmc
    lda _data_byte
    sta _buff, x
    inx
    cpx #$04
    bne :-

    lda _buff+2
    cmp #$01            ; expecting $01 in buff[2]
    jne @return         ; so fail if otherwise

    lda _buff+3
    cmp #$AA            ; and same for $AA in buff[3]
    jne @return

    stz _arg            ; arg for ACMD41
    stz _arg+1          ; 0x40000000 - host supports HCS
    stz _arg+2
    lda #$40
    sta _arg+3

    lda #$E8            ; wait for card to be ready
    sta _tmr            ; tmr = 1000
    lda #$03
    sta _tmr+1

:   lda _tmr            ; if timed out, move on
    ora _tmr+1
    beq @card_ready_v2

    lda #ACMD41         ; send ACMD41(0x40000000)
    sta _cmd
    jsr _send_cmd
    cmp #$00            ; ready if response is 0
    beq @card_ready_v2

    lda #$00            ; delay 1000us
    jsr _dly_us
    jsr _dly_us
    jsr _dly_us
    lda #$E8
    jsr _dly_us

    lda _tmr            ; 16 bit decrement tmr
    sec
    sbc #$01
    sta _tmr
    bcs :-
    dec _tmr+1
    jmp :-

@card_ready_v2:
    lda _tmr            ; is tmr 0?
    ora _tmr+1
    jeq @return         ; return (fail) if so

    lda #CMD58
    sta _cmd
    stz _arg
    stz _arg+1
    stz _arg+2
    stz _arg+3

    jsr _send_cmd       ; send CMD58(0)
    cmp #$00            ; expect a 0 back
    jne @return         ; return (fail) otherwise

    ldx #$00            ; write 4 byte response to buffer
:   jsr _rcvr_mmc
    lda _data_byte
    sta _buff, x
    inx
    cpx #$04
    bne :-

    lda _buff           ; check if bit 6 is set of response
    and #$40
    beq :+              ; if so, is a block device
    lda #(CT_SD2|CT_BLOCK)
    jmp @success
:   lda #CT_SD2         ; else, standard
    jmp @success

@success:
    sta _CardType
@SDv1:  ; not implemented for now
@return:
    jsr _release_spi;
    
    lda _CardType
    bne :+              ; if CardType is 0, return failure
    lda #STA_NOINIT
    rts
:   lda #00             ; else, return success
    rts
.endproc

; unsigned char disk_readp()
; read partial sector

.proc _disk_readp
    lda #<_buff     ; set __buff (write buffer) to bottom of _buff
    sta __buff      ; these names are bad
    lda #>_buff
    sta __buff+1

    lda _CardType
    and #CT_BLOCK
    bne @block

@byte:
    stz _arg        ; arg = sector * 512
    lda _sector     ; move up 1 byte
    sta _arg+1
    lda _sector+1
    sta _arg+2
    lda _sector+2
    sta _arg+3
    asl _arg+1      ; shift left 1 bit
    rol _arg+2
    rol _arg+3
    jmp @go

@block:
    lda _sector
    sta _arg
    lda _sector+1
    sta _arg+1
    lda _sector+2
    sta _arg+2
    lda _sector+3
    sta _arg+3

@go:
    lda #RES_ERROR
    sta _result

    lda #CMD17      ; READ_SINGLE_BLOCK
    sta _cmd
    jsr _send_cmd
    cmp #$00        ; fail if response is not $00
    jne @return

    lda #$E8        ; try 1000 times
    sta _tmr
    lda #$03
    sta _tmr+1

@wait_response:
    lda #$64        ; wait 100us
    jsr _dly_us
    jsr _rcvr_mmc   ; fetch a byte
    lda _data_byte
    cmp #$FF        ; if it's not FF we've got a response
    bne @got_response_or_timeout

    lda _tmr        ; 16-bit decrement _tmr
    sec
    sbc #$01
    sta _tmr
    bcs :+
    dec _tmr+1
:   ora _tmr+1
    bne @wait_response

@got_response_or_timeout:

    cmp #$FE        ; check if byte is $FE - data present
    jne @return     ; fail if not

    lda _offset     ; check for an offset
    ora _offset+1
    beq :+

    lda _offset     ; skip leading bytes
    sta _tmr
    lda _offset+1
    sta _tmr+1

    jsr _skip_mmc

:   lda #$02        ; setup tmr (for bytes to skip at end)
    sta _tmr        ; tmr = 514 - offset - count
    sta _tmr+1

    lda _offset
    eor #$FF
    sec
    adc _tmr
    sta _tmr
    lda _offset+1
    eor #$FF
    adc _tmr+1
    sta _tmr+1

    lda _count
    eor #$FF
    sec
    adc _tmr
    sta _tmr
    lda _count+1
    eor #$FF
    adc _tmr+1
    sta _tmr+1

@receive_data:
    jsr _rcvr_mmc   ; receive a byte
    lda _data_byte  ; write to __buff
    ldy #$00
    sta (__buff),y
    inc __buff      ; increment __buff
    bne :+
    inc __buff+1
:   lda _count      ; 16-bit decrement of count
    sec
    sbc #$01
    sta _count
    bcs :+
    dec _count+1
:   ora _count+1
    bne @receive_data   ; keep going if count >0

@success:
    jsr _skip_mmc   ; skip remaining bytes (tmr) and set RES_OK
    lda #RES_OK
    sta _result

@return:
    jsr _release_spi
    lda _result
    rts
.endproc

; void __fastcall__ dly_us(unsigned char n);
; delay for (approximately) n cycles

.proc _dly_us
    lsr         ; shift 3 bytes right (divide by 8)
    lsr
    lsr
    tax
@loop:
    dex         ; 2 cycles
    txa         ; 1 cycle (burn a cycle so loop is actually 8)
    beq @done   ; 2 cycles
    jmp @loop   ; 3 cycles
@done:
    rts
.endproc

; 
; void init_port()
; initialize VIA for SD communication

.proc _init_port
    lda IO_VIA_PORTB
    ora #(SD_MOSI | SD_SCK | SD_CS)
    sta IO_VIA_PORTB
    lda IO_VIA_DDRB
    ora #(SD_MOSI | SD_SCK | SD_CS)
    and #<~SD_MISO
    sta IO_VIA_DDRB
    rts
.endproc

; void rcvr_mmc(void)
; receive a byte from the MMC (bitbanging)

.proc _rcvr_mmc
    lda IO_VIA_PORTB    ; set data bit high
    ora #SD_MOSI
    sta IO_VIA_PORTB
    stz _data_byte;
    
    ldy #$08
@loop:
    asl _data_byte  ; shift data left
    lda IO_VIA_PORTB
    and #SD_MISO
    beq @clock
    inc _data_byte

@clock:
    lda IO_VIA_PORTB
    ora #SD_SCK ; pulse clock
    sta IO_VIA_PORTB
    and #<~SD_SCK
    sta IO_VIA_PORTB
    dey
    bne @loop

    rts
.endproc

; void release_spi()
; deselect card & release SPI bus

.proc _release_spi
    lda IO_VIA_PORTB
    ora #SD_CS      ; release chip select
    sta IO_VIA_PORTB
    jmp _rcvr_mmc    ; return through rcvr_mmc
.endproc

; unsigned char send_cmd()
; send a command packet to MMC

.proc _send_cmd
    lda #$80            ; if high byte set, it's a ACMD command
    bit _cmd
    beq @enable_card

    lda _cmd            ; stash low 7 bytes of CMD
    and #$7F
    sta _tmp_cmd

    lda _arg+3          ; stash arg
    sta _tmp_arg+3
    lda _arg+2
    sta _tmp_arg+2
    lda _arg+1
    sta _tmp_arg+1
    lda _arg
    sta _tmp_arg

    lda #CMD55          ; send CMD55(0)
    sta _cmd
    stz _arg
    stz _arg+1
    stz _arg+2
    stz _arg+3
    jsr _send_cmd

    lda _tmp_arg+3      ; recover arg & cmd
    sta _arg+3
    lda _tmp_arg+2
    sta _arg+2
    lda _tmp_arg+1
    sta _arg+1
    lda _tmp_arg
    sta _arg

    lda _tmp_cmd
    sta _cmd

    lda _data_byte      ; return here if data_byte > 1
    cmp #$02
    ldx #$00
    bcc @enable_card
    lda _data_byte
    rts

@enable_card:
    lda IO_VIA_PORTB   ; send dummy byte with CS high
    ora #SD_CS
    sta IO_VIA_PORTB
    jsr _rcvr_mmc

    lda IO_VIA_PORTB   ; send dummy byte with CS low
    and #<~SD_CS
    sta IO_VIA_PORTB
    jsr _rcvr_mmc

    lda _cmd            ; send cmd
    sta _data_byte
    jsr _xmit_mmc

    lda _arg+3          ; send arg, high byte first
    sta _data_byte
    jsr _xmit_mmc

    lda _arg+2
    sta _data_byte
    jsr _xmit_mmc

    lda _arg+1
    sta _data_byte
    jsr _xmit_mmc

    lda _arg
    sta _data_byte
    jsr _xmit_mmc

    lda #$01            ; dummy CRC
    sta _data_byte

    lda _cmd
    cmp #CMD0
    bne :+

    lda #$95            ; CRC for CMD0(0)
    sta _data_byte

:   lda _cmd
    cmp #CMD8
    bne :+

    lda #$87            ; CRC for CMD8(0x1AA)
    sta _data_byte

:   jsr _xmit_mmc       ; output CRC

    ldx #$0A

@wait_response:         ; 10 attempts for a valid response
    jsr _rcvr_mmc
    lda #$80
    bit _data_byte
    beq @done
    dex
    bne @wait_response

@done:
    lda _data_byte      ; return with the data byte
    rts
.endproc

; void skip_mmc()
; skip bytes on the MMC (bitbanging)

.proc _skip_mmc
    lda IO_VIA_PORTB    ; set data bit high
    ora #SD_MOSI
    sta IO_VIA_PORTB

@loop1:
    ldx #$08
    lda IO_VIA_PORTB

@loop2:
    ora #SD_SCK ; pulse clock
    sta IO_VIA_PORTB
    and #<~SD_SCK
    sta IO_VIA_PORTB
    dex
    bne @loop2

    lda _tmr
    sec
    sbc #$01
    sta _tmr
    bcs :+
    dec _tmr+1
:   ora _tmr+1
    bne @loop1

    rts
.endproc

; void xmit_mmc()
; transmit a byte to the MMC (bitbanging)

.proc _xmit_mmc
    ldx #$08
    lda IO_VIA_PORTB
    
@loop:
    and #<~SD_MOSI  ; set MISO low
    asl _data_byte  ; shift data byte left
                    ; top bit is now in carry
    bcc @out
    ora #SD_MOSI    ; set MISO high if carry set

@out:
    sta IO_VIA_PORTB    ; write data bit
    ora #SD_SCK         ; pulse clock
    sta IO_VIA_PORTB
    and #<~SD_SCK
    sta IO_VIA_PORTB

    dex
    bne @loop
    rts
.endproc
