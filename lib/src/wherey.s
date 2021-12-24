        .export _wherey

        .importzp tmp1
        .include "compe.inc"

; unsigned char wherey (void)

_wherey:
        lda SCREEN_PTR          ; load low byte of screen pointer
        and #%11100000          ; and to get only Y component
        lsr                     ; shift right 5 times - into bottom 3 bits
        lsr
        lsr
        lsr
        lsr
        sta tmp1                ; stash in tmp1
        lda SCREEN_PTR + 1      ; load high byte of screen pointer
        and #%00000011          ; keep only low 2 bytes
        asl                     ; shift left 3 times - bits 3-5
        asl
        asl
        clc
        adc tmp1                ; add tmp1 to accumulator
        ldx #$00                ; clear X register
        rts                     ; return

