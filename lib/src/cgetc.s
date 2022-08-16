; cgetc - get a character from the keyboard

        .export _cgetc
        .import cursor
        .include "compe.inc"


; char cgetc (void);

_cgetc:
        lda cursor
        beq @wait
        lda #$F9        ; enable cursor
        sta VIDEO_DATA
@wait:  lda IO_VIA_IFR
        and #%00000010
        beq @wait
        lda IO_VIA_PORTA
        pha
        lda #$F8        ; disable cursor
        pla
        rts
