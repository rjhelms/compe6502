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
        lda SCREEN_PTR  ; load low byte of screen pointer
        and #%11100000  ; set X pos to 0
        sta SCREEN_PTR  ; store
        pla             ; pull X from stack
        clc
        adc SCREEN_PTR  ; add to screen pointer
        sta SCREEN_PTR
        rts             ; return


