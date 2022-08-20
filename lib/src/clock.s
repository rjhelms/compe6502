;
; clock_t clock (void);
;

        .export _clock
        .importzp sreg

        .include "compe.inc"

.code

; per pce implementation, clock might change during this function
;
; rather than disabling interrupts, load low byte first and check at the end
; and loop if it's changed

.proc _clock
        lda CLOCK_TICKS
        ldy CLOCK_TICKS+3
        sty sreg+1
        ldy CLOCK_TICKS+2
        sty sreg
        ldx CLOCK_TICKS+1
        cmp CLOCK_TICKS
        bne _clock
        rts
.endproc
