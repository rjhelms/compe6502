.PC02


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

.macpack	longbranch

.global _tmr
.global _data_byte
.global _cmd, _arg, _tmp_cmd, _tmp_arg

.export _dly_us
.export _init_port
.export _release_spi
.export _rcvr_mmc
.export _send_cmd
.export _skip_mmc
.export _xmit_mmc

.segment "BSS"
    _cmd: .res 1, $00
    _arg: .res 4, $00
    _tmp_cmd: .res 1, $00
    _tmp_arg: .res 4, $00

.segment "CODE"
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