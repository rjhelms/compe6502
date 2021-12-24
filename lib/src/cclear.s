.export _cclearxy, _cclear
.import gotoxy, cout, chlinedirect

.include "zeropage.inc"

; void __fastcall__ cclearxy (unsigned char x, unsigned char y, unsigned char length);

_cclearxy:
        pha
        jsr gotoxy
        pla

; void __fastcall__ cclear (unsigned char length);
_cclear:
        ldx #' '
        jmp chlinedirect
