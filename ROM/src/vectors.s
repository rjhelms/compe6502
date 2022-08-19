
.export NMIVEC0, BRKVEC0, IRQVEC0, NMIRET0, BRKRET0, IRQRET0, WARMRESET, PWR_UP
.export CLOCK_TICKS

.export VECT_TAB_START, VECT_TAB_END

.import NMI_VECTOR, B_COLDSTART, IRQ_VECTOR

.segment "VECT_TAB"
        VECT_TAB_START:
        NMIVEC0:        .res 2
        BRKVEC0:        .res 2
        IRQVEC0:        .res 2
        NMIRET0:        .res 2
        BRKRET0:        .res 2
        IRQRET0:        .res 2
        WARMRESET:      .res 2
        PWR_UP:         .res 1
        CLOCK_TICKS:    .res 4
        VECT_TAB_END:

.segment "BOOTVECT"

.addr NMI_VECTOR
.addr B_COLDSTART
.addr IRQ_VECTOR