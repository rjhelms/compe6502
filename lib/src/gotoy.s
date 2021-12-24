        .export _gotoy

        .include "compe.inc"

; void __fastcall__ gotoy (unsigned char x);

_gotoy:
        pha                     ; push desired Y to stack

; zero out Y
        lda #>VRAM_START        ; high byte of screen pointer is high byte of VRAM_START
        sta SCREEN_PTR + 1
        lda SCREEN_PTR          ; load low byte of screen pointer
        and #%00011111          ; keep only low 5 bytes - this is X coordinate
        sta SCREEN_PTR

; set low byte
        pla                     ; pull A and push back onto stack for high byte
        pha
        asl                     ; shift left 5 times
        asl
        asl
        asl
        asl
        clc
        adc SCREEN_PTR          ; add to low byte of screen pointer
        sta SCREEN_PTR          ; and store

; set high byte
        pla                     ; pull A for high byte                 
        lsr                     ; shift right 3 times
        lsr
        lsr
        clc
        adc SCREEN_PTR + 1      ; add to high byte of screen pointer
        sta SCREEN_PTR + 1      ; and store

        rts                     ; rts
