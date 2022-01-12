.SEGMENT "CODE"

LOAD:
        jsr     CLOAD           ; call cassette load
        lda     STL             ; transfer start and end addresses to BASIC
        sta     TXTTAB          ;       ZP locations
        inc     TXTTAB
        lda     STH
        sta     TXTTAB + 1
        lda     L
        sta     VARTAB
        lda     H
        sta     VARTAB + 1
        jmp     FIX_LINKS       ; return via FIX_LINKS

SAVE:
        ; TODO: get the file name (CHRGET?)

        lda     TXTTAB          ; TXTTAB is start of program memory, so copy
        sta     STL             ;       to cassette start address
        dec     STL             ; seems to be one byte farther?
        lda     TXTTAB + 1
        sta     STH
        lda     VARTAB          ; VARTAB is right after program memory, so copy
        sta     L               ;       to cassette end address
        lda     VARTAB + 1
        sta     H
        jmp     CSAVE           ; return via CSAVE
