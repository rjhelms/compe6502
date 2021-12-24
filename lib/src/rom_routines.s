.include "compe.inc"

.macro  entrypoint LBL, ADR
        LBL := ADR
        .export LBL
.endmacro

        entrypoint _M_COLDRESET, M_COLDRESET
        entrypoint _M_WARMRESET, M_WARMRESET
        entrypoint _M_PRBYTE, M_PRBYTE

; reserved bytes here

        entrypoint _B_BEEP, B_BEEP
        entrypoint _B_KEY_READ, B_KEY_READ
        entrypoint _B_KEY_GET, B_KEY_GET
        entrypoint _B_IO_INIT, B_IO_INIT
        entrypoint _B_VRAM_CLEAR_FULL, B_VRAM_CLEAR_FULL
        entrypoint _B_VRAM_CLEAR, B_VRAM_CLEAR
        entrypoint _B_COUT_NO_CC, B_COUT_NO_CC
        entrypoint _B_COUT, B_COUT
        entrypoint _B_CHECK_SCROLL, B_CHECK_SCROLL
        entrypoint _B_SCROLL, B_SCROLL
        entrypoint _B_COLDSTART, B_COLDSTART
