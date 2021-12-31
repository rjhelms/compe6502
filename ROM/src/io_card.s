.PC02

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

IO_MASK_SD_MISO         = %00000001
IO_MASK_SD_MOSI         = %00000010
IO_MASK_SD_SCK          = %00000100
IO_MASK_SD_CS           = %00001000
IO_MASK_KBD_REPT        = %00010000
IO_MASK_SPKR            = %00100000
IO_MASK_CAS_TX          = %01000000
IO_MASK_CAS_RX          = %10000000

IO_PCR_CA2_HANDSHAKE    = %00001000

.segment "CODE"

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
