.export _cvlinexy, _cvline
.import gotoxy, putchar, newline

.include "zeropage.inc"

; void __fastcall__ cvlinexy (unsigned char x, unsigned char y, unsigned char length);

_cvlinexy:
        pha
        jsr gotoxy
        pla             ; fall through to _cvline

; void __fastcall__ cvline (unsigned char length);

_cvline:
        ldx #$B3
        stx tmp1
        cmp #$00
        beq done
        sta tmp2
:       lda tmp1
        jsr putchar
        jsr newline
        dec tmp2
        bne :-
done:   rts
