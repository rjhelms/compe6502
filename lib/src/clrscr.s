    .export _clrscr
    .import _VRAM_CLEAR_FULL

    .include "compe.inc"

; _clrscr := _VRAM_CLEAR_FULL


; void clrscr (void);

; I think this is better than what's in ROM

_clrscr:
        lda #<VRAM_START        ; reset screen pointer to top left
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR + 1
        ldy #$00
:       lda #$00                ; load zero to accumulator
:       sta (SCREEN_PTR), Y     ; write to current screen address
        iny                     ; increment screen pointer
        bne :-                  ; check if low byte wrapped
        inc SCREEN_PTR + 1      ; increment high byte
        lda SCREEN_PTR + 1
        cmp #>VRAM_END          ; check if high byte is at end
        bne :--
        lda #<VRAM_START        ; reset screen pointer to top left
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR+1
        rts                     ; return
