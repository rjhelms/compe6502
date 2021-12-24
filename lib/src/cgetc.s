; cgetc - get a character from the keyboard

; TODO - support cursor

        .export _cgetc

        .include "compe.inc"

;        .import _RDKEY

; char cgetc (void);

_cgetc:
        lda IO_VIA_IFR
        and #%00000010
        beq _cgetc
        lda IO_VIA_PORTA
        rts
