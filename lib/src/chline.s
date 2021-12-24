.export _chlinexy, _chline, chlinedirect
.import gotoxy, cout

.include "zeropage.inc"

; void __fastcall__ chlinexy (unsigned char x, unsigned char y, unsigned char length);

_chlinexy:
        pha
        jsr gotoxy
        pla             ; fall through to _chline

; void __fastcall__ chline (unsigned char length);

_chline:
        ldx #$C4

chlinedirect:
        stx tmp1
        cmp #$00
        beq done
        sta tmp2
:       lda tmp1
        jsr cout
        dec tmp2
        bne :-
done:   rts
