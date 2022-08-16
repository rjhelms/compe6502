        .export _gotoy

        .include "compe.inc"

; void __fastcall__ gotoy (unsigned char x);

_gotoy:
        pha             ; push desired Y to stack
        lda #$DF        ; set Y absolute
        sta VIDEO_DATA
        pla
        sta VIDEO_DATA
        rts