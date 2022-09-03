.segment "CODE"

.export _dly_us

.proc _dly_us
    lsr         ; shift 3 bytes right (divide by 8)
    lsr
    lsr
    tax
@loop:
    dex         ; 2 cycles
    txa         ; 1 cycle (burn a cycle so loop is actually 8)
    beq @done   ; 2 cycles
    jmp @loop   ; 3 cycles
@done:
    rts
.endproc