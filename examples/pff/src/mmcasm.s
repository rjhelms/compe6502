.segment "CODE"

IO_VIA_PORTB    = $8000
IO_VIA_DDRB     = $8002

SD_MISO         = %00000001
SD_MOSI         = %00000010
SD_SCK          = %00000100
SD_CS           = %00001000

.global _tmr

.export _dly_us
.export _skip_mmc

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
    ora #SD_SCK
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