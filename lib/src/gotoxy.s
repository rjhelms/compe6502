        .export gotoxy, _gotoxy, _gotox
        .import popa, _gotoy

        .include "compe.inc"

; gotoxy - used when called elsewhere in conio library
gotoxy:
        jsr popa        ; get Y
                        ; and fall through

; void __fastcall__ gotoxy (unsigned char x, unsigned char y);

_gotoxy:
        jsr _gotoy      ; call _gotoy
        jsr popa        ; get X

; void __fastcall__ gotox (unsigned char x);

_gotox:
        pha             ; push X on stack
        lda #$DE        ; move X absolute
        sta VIDEO_DATA
        pla
        sta VIDEO_DATA
        rts


