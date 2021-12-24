; char cpeekc (void);

        .export _cpeekc

        .include "compe.inc"

_cpeekc:
        ldx #$00
        lda (SCREEN_PTR, X)
        rts
