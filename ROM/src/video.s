.PC02

VRAM_START      = SLOT6
VRAM_END        = SLOT6 + $400
SCREEN_END      = SLOT6 + $300

.segment "ZEROPAGE"
SCREEN_PTR: .res 2
SCROLL_PTR: .res 2

.segment "CODE"

.proc VRAM_TEST
START:
        lda #<VRAM_START        ; initialize SCREEN_PTR to top of VRAM
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR + 1
        ldy #$00

CHECK15:
        lda #$15                ; store #$15 into current address
        sta (SCREEN_PTR), Y
        lda (SCREEN_PTR), Y     ; read back from VRAM
        cmp #$15                ; compare with #$15
        bne BAD_MEM             ; if not matching, this address is bad
        jmp CHECKEA             ; ... otherwise, try with $EA

BAD_MEM:
        jmp FAIL

CHECKEA:
        lda #$EA                ; store #$EA into current address
        sta (SCREEN_PTR), Y
        lda (SCREEN_PTR), Y     ; read back from VRAM
        cmp #$EA                ; compare with #$EA
        bne BAD_MEM             ; if not matching, this address is bad

        iny                     ; increment Y (low byte of address)
        bne CHECK15             ; if not $00, continue with next address
        inc SCREEN_PTR + 1      ; otherwise, increment high byte
        lda SCREEN_PTR + 1      ; check if we're at VRAM_END
        cmp #>VRAM_END
        beq DONE                ; if so, done
        jmp CHECK15             ; otherwise, continue with next address

DONE:
        lda #<VRAM_START        ; reset screen pointer to top of VRAM
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR + 1
        rts                     ; and return
FAIL:
        jmp FAIL                ; failed - just spin at last address
.endproc

; VRAM_CLEAR_FULL
; resets the screen pointer, and falls through to VRAM_CLEAR to write $00 to
; the end of VRAM
.proc VRAM_CLEAR_FULL
        lda #<VRAM_START        ; reset screen pointer
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR + 1
.endproc

; VRAM_CLEAR
; writes $00 from the screen pointer to the end of VRAM
.proc VRAM_CLEAR
        ldy #$00
STORE:
        lda #$00                ; store #$00 to current address
        sta (SCREEN_PTR), Y
        iny                     ; increment low byte
        bne STORE
        inc SCREEN_PTR + 1      ; increment high byte
        lda SCREEN_PTR + 1
        cmp #>VRAM_END
        beq DONE                ; done if at end of VRAM
        jmp STORE
DONE:
        lda #<VRAM_START        ; reset screen pointer
        sta SCREEN_PTR
        lda #>VRAM_START
        sta SCREEN_PTR + 1
        rts                     ; and return
.endproc

; COUT_NO_CC
; output value in A register to console, without handling control characters
.proc COUT_NO_CC
        phy
        ldy #$00                ; set Y index to 0
        sta (SCREEN_PTR), Y     ; store A register to current address in
                                ;         SCREEN_PTR
        inc SCREEN_PTR          ; increment low byte of SCREEN_PTR
        bne RET                 ; if not 0, return
        inc SCREEN_PTR + 1      ; else increment high byte of SCREEN_PTR
RET:
        ply
        jmp CHECK_SCROLL
.endproc

; COUT
; output value in A register to console, handling control characters
.proc COUT
        cmp #$20
        bcs COUT_NO_CC
CHK_07: cmp #$07        ; bell
        bne CHK_08
        jmp BEEP
CHK_08: cmp #$08        ; backspace
        bne CHK_0D
        jmp COUT_BS
CHK_0D: cmp #$0D        ; carriage return
        bne RET
        jmp COUT_CR
RET:    rts
.endproc

.proc COUT_BS
        phy
        lda #$00                ; clear cursor moving pointer
        ldy #$00
        sta (SCREEN_PTR), Y
        sec
        lda SCREEN_PTR
        sbc #1
        bcs RET
        dec SCREEN_PTR + 1
RET:
        sta SCREEN_PTR
        ply
        rts
.endproc

.proc COUT_CR
        phy
        lda #$00                ; clear cursor moving pointer
        ldy #$00
        sta (SCREEN_PTR), Y
        lda SCREEN_PTR
        clc
        adc #$20                ; increment pointer one line
        bcc RET                 ; if carry clear, still in same page
        inc SCREEN_PTR + 1      ; else, increase high byte of pointer
RET:
        and #$E0                ; set low byte to beginning of line
        sta SCREEN_PTR
        ply
        jmp CHECK_SCROLL
.endproc

.proc CHECK_SCROLL
        lda SCREEN_PTR + 1
        cmp #>SCREEN_END
        bcc RET
        jsr SCROLL
RET:
        rts
.endproc

.proc SCROLL
        pha                 ; push A and Y to stack
        phy
        lda SCREEN_PTR      ; push SCREEN_PTR to stack
        pha
        lda SCREEN_PTR + 1
        pha
        lda #<VRAM_START    ; reset low byte of screen pointer to top of screen
        sta SCREEN_PTR
        clc
        adc #$20            ; set low byte of scroll pointer one line lower
        sta SCROLL_PTR
        lda #>VRAM_START    ; set high byte of both pointers to top of screen
        sta SCREEN_PTR + 1
        sta SCROLL_PTR + 1
        ldy #$00
LOOP:
        lda (SCROLL_PTR), Y ; load byte at scroll pointer + Y
        sta (SCREEN_PTR), Y ; store in screen pointer + Y
        iny                 ; increment Y
        bne LOOP
        inc SCREEN_PTR + 1  ; increment high bytes if paged
        inc SCROLL_PTR + 1
        lda SCREEN_PTR + 1    
        cmp #>SCREEN_END    ; if SCREEN_PTR is not past the end of the screen,
        bne LOOP            ; keep going

        jsr VRAM_CLEAR      ; clear the rest of VRAM

        pla                 ; pull original screen pointer from stack
        sta SCREEN_PTR + 1
        pla
        sta SCREEN_PTR
        sec
        sbc #$20            ; subtract #$20 from screen pointer (one line)
        sta SCREEN_PTR
        bcs RET             
        dec SCREEN_PTR + 1  ; carry to high byte if needed
RET:
        ply                 ; pull Y register from stack
        pla                 ; pull A register from stack
        rts                 ; return
.endproc
