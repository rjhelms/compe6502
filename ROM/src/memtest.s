.include "asminc/zeropage.inc"

.export MEM_TEST

.import COUT, BEEP
.import PRBYTE

.segment "CODE"

.proc MEM_TEST
START:
        lda #$00
        sta MSGL
        lda #$02
        sta MSGH
        ldy #$00

        lda MSGH
        jsr PRBYTE
        tya
        jsr PRBYTE

CHECK55:
        lda #$55
        sta (MSGL), Y
        lda (MSGL), Y
        cmp #$55
        bne BAD_MEM
        jmp CHECKAA

BAD_MEM:
        jsr BEEP
        jmp DONE

CHECKAA:
        lda #$AA
        sta (MSGL), Y
        lda (MSGL), Y
        cmp #$AA
        bne BAD_MEM

        iny
        bne CHECK55
        inc MSGH

DISP_ADDR:
        sec
        lda SCREEN_PTR
        sbc #$04
        sta SCREEN_PTR

        lda MSGH
        jsr PRBYTE
        tya
        jsr PRBYTE

        beq DONE
        jmp CHECK55


DONE:
        lda #$0D
        jmp COUT
.endproc