; void __fastcall__ cputcxy (unsigned char x, unsigned char y, char c);


.export _cputcxy, _cputc, cout, putchar, newline

.include "compe.inc"

.import gotoxy
.import _COUT

; void __fastcall__ cputcxy (unsigned char x, unsigned char y, char c);

_cputcxy:
        pha             ; Save C
        jsr gotoxy
        pla             ; restore C and fall into _cputc

; void __fastcall__ cputc (char c);

_cputc:
        cmp #$0D        ; test for \r
        beq left
        cmp #$0A        ; test for \n
; any other control characters to check for? tab, backspace, etc
        beq newline

cout:
        jsr putchar
        inc SCREEN_PTR
        bne :+
        inc SCREEN_PTR + 1
:       rts


left:
        lda SCREEN_PTR
        and #$E0
        sta SCREEN_PTR
        rts

newline:
        lda SCREEN_PTR
        clc
        adc #$20
        sta SCREEN_PTR
        bcc :+
        lda SCREEN_PTR + 1
        adc #$00
        sta SCREEN_PTR + 1
:       rts

putchar:                        ; put character on screen w/o advancing cursor
        ldy #$00
        sta (SCREEN_PTR), Y
        rts