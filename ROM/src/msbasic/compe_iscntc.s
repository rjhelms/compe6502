.segment "CODE"

ISCNTC:
        jsr KEY_READ
        cmp #03
        beq ISCNTC_STOP
        rts
ISCNTC_STOP:
        sec
        jmp STOP
