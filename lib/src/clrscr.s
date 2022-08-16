    .export _clrscr

    .include "compe.inc"

; void clrscr (void);

; I think this is better than what's in ROM

_clrscr:
        lda #$FE
        sta VIDEO_DATA
        rts