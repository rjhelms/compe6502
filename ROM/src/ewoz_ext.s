; Extensions to eWoz

.segment "ZEROPAGE"
; additional pointers for processor registers etc

AREG:   .res 1
XREG:   .res 1
YREG:   .res 1
PREG:   .res 1
SREG:   .res 1
PCL:    .res 1
PCH:    .res 1

.segment "MON"

.proc PRSTATUS
        lda #$0D
        jsr COUT
        jsr BEEP
        ldy #$07        ; output in reverse order
:       lda AREG, Y
        jsr PRBYTE
        lda #$20
        jsr COUT
        dey
        bne :-
        lda #$0D
        jsr COUT
        rts
.endproc