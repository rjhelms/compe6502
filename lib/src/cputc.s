; void __fastcall__ cputcxy (unsigned char x, unsigned char y, char c);


.export _cputcxy, _cputc, cputdirect, putchar, newline

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

cputdirect:
        jsr putchar
        lda #$D6
        sta VIDEO_DATA
        rts

left:
        lda #$DE        ; set X absolute
        sta VIDEO_DATA
        lda #$00
        sta VIDEO_DATA
        rts

newline:
        lda #$DD        ; set Y relatve
        sta VIDEO_DATA
        lda #$01
        sta VIDEO_DATA
        rts

putchar:                        ; put character on screen w/o advancing cursor
        pha
        lda #$D0
        sta VIDEO_DATA
        pla
        sta VIDEO_DATA
        rts