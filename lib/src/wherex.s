        .export _wherex

        .include "compe.inc"

; unsigned char wherex (void);

_wherex:
        ldx #$00
        lda SCREEN_PTR
        and #$1F
        rts
