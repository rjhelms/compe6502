        .export _kbhit

        .include "compe.inc"

; unsigned char kbhit (void);

_kbhit:
        lda IO_VIA_IFR
        and #%00000010
        rts
