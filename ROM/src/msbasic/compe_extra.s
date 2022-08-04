.segment "EXTRA"

.PC02

MONRDKEY:
        ; TODO: proper cursor shenanigans
        ; lda #$B1                ; draw a cursor
        ; sta (SCREEN_PTR)
        jsr KEY_GET             ; wait for a key
        ; pha
        ; lda #$00
        ; sta (SCREEN_PTR)
        ; pla
        pha
        jsr COUT
        pla
        rts
