.PC02

.segment "CODE"

IO_VIA_PORTB    = $8000
IO_VIA_DDRB     = $8002

SD_MISO         = %00000001
SD_MOSI         = %00000010
SD_SCK          = %00000100
SD_CS           = %00001000

.global _tmr
.global _data_byte

.export _dly_us
.export _init_port
.export _release_spi
.export _rcvr_mmc
.export _skip_mmc
.export _xmit_mmc

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
    
    ldx #$08
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
    dex
    bne @loop

    rts;
.endproc

; void release_spi()
; deselect card & release SPI bus

.proc _release_spi
    lda IO_VIA_PORTB
    ora #SD_CS      ; release chip select
    sta IO_VIA_PORTB
    jmp _rcvr_mmc    ; return through rcvr_mmc
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

