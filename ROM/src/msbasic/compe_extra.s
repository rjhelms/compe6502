.segment "EXTRA"

.PC02
.importzp SCREEN_PTR

MONRDKEY:
        lda #$B1                ; draw a cursor
        sta (SCREEN_PTR)
        jsr KEY_GET             ; wait for a key
        pha
        lda #$00
        sta (SCREEN_PTR)
        pla
        pha
        jsr COUT
        pla
        rts
