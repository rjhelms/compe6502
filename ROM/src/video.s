
; Video routines for Pico-based video board

; The general operation of these routines is that the Pico is operating in text
; mode, and control will be returned to the calling program with the Pico back
; in text mode.

.PC02

.include "asminc/slot_defs.inc"
.include "asminc/zeropage.inc"

.import BEEP
.export VIDEO_SEND_BYTE, VIDEO_INIT
.export VRAM_TEST, VRAM_CLEAR, VRAM_CLEAR_FULL
.export MOVE_X_REL, MOVE_Y_REL
.export COUT_NO_CC, COUT

VIDEO_STATUS    = SLOT7
VIDEO_DATA      = SLOT7 + $01

.segment "ZPBIOS": zeropage
VIDCMDL:        .res 1
VIDCMDH:        .res 1

.segment "SYS"

.proc VIDEO_SEND_BYTE
        bit VIDEO_STATUS        ; check if buffer is full
        bpl VIDEO_SEND_BYTE     ; spin if it is
        sta VIDEO_DATA          ; write accumulator to FIFO
        rts
.endproc

.proc VIDEO_INIT
        lda #$F0
        jsr VIDEO_SEND_BYTE
        lda #$02
        jmp VIDEO_SEND_BYTE
.endproc

.proc VRAM_TEST
        rts                     ; just don't do it for now - eventually will pull this out
.endproc

; VRAM_CLEAR_FULL
; resets the screen pointer, and falls through to VRAM_CLEAR to write $00 to
; the end of VRAM
.proc VRAM_CLEAR_FULL
        lda #$03                 ; end text mode
        jsr VIDEO_SEND_BYTE
        lda #$FE                 ; clear screen
        jsr VIDEO_SEND_BYTE
        lda #$02                 ; start text mode
        jsr VIDEO_SEND_BYTE
.endproc

; VRAM_CLEAR
; writes $00 from the screen pointer to the end of VRAM
.proc VRAM_CLEAR
        rts
.endproc

.proc MOVE_X_REL
        pha
        lda #$03
        jsr VIDEO_SEND_BYTE
        lda #$DC
        jsr VIDEO_SEND_BYTE
        pla
        jsr VIDEO_SEND_BYTE
        lda #$02
        jmp VIDEO_SEND_BYTE
.endproc

.proc MOVE_Y_REL
        pha
        lda #$03
        jsr VIDEO_SEND_BYTE
        lda #$DD
        jsr VIDEO_SEND_BYTE
        pla
        jsr VIDEO_SEND_BYTE
        lda #$02
        jmp VIDEO_SEND_BYTE
.endproc

; COUT_NO_CC
; output value in A register to console, without handling control characters
.proc COUT_NO_CC
        pha     ; push byte to stack
        lda #$03 ; end text
        jsr VIDEO_SEND_BYTE
        lda #$D0 ; write single character
        jsr VIDEO_SEND_BYTE
        pla     ; pop byte off stack to send
        jsr VIDEO_SEND_BYTE
        lda #$02 ; start text
        jmp VIDEO_SEND_BYTE
.endproc

; COUT
; output value in A register to console, handling control characters
.proc COUT
CHK_07: cmp #$07        ; bell
        bne OUT
        jmp BEEP
OUT:    jmp VIDEO_SEND_BYTE
.endproc
