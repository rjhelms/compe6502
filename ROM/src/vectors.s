VEC_TAB_LEN = VECT_TAB_END - VECT_TAB_START

.segment "VECT_TAB"
        VECT_TAB_START:
        NMIVEC0:        .res 2
        BRKVEC0:        .res 2
        IRQVEC0:        .res 2
        NMIRET0:        .res 2
        BRKRET0:        .res 2
        IRQRET0:        .res 2

        PWR_UP:         .res 1
        VECT_TAB_END:

.segment "VECTORS"

.addr NMI_VECTOR
.addr B_COLDSTART
.addr IRQ_VECTOR