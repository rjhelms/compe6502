.debuginfo + 

.PC02

.include "slot_defs.inc"
.include "io_card.s"
.include "video.s"

.segment "CODE"
RESERVE:
        rts

.segment "BIOS"

; jump table for BIOS functions
M_COLDRESET:            jmp     MON_COLDRESET
M_WARMRESET:            jmp     MON_WARMRESET
M_PRBYTE:               jmp     PRBYTE
B_Reserve03:            jmp     RESERVE
B_Reserve04:            jmp     RESERVE
B_Reserve05:            jmp     RESERVE
B_Reserve06:            jmp     RESERVE
B_Reserve07:            jmp     RESERVE
B_Reserve08:            jmp     RESERVE
B_Reserve09:            jmp     RESERVE
B_Reserve10:            jmp     RESERVE
B_Reserve11:            jmp     RESERVE
B_Reserve12:            jmp     RESERVE
B_Reserve13:            jmp     RESERVE
B_Reserve14:            jmp     RESERVE
B_Reserve15:            jmp     RESERVE
B_Reserve16:            jmp     RESERVE
B_Reserve17:            jmp     RESERVE
B_Reserve18:            jmp     RESERVE
B_Reserve19:            jmp     RESERVE
B_SHOWMSG:              jmp     SHWMSG
B_BEEP:                 jmp     BEEP
B_KEY_READ:             jmp     KEY_READ
B_KEY_GET:              jmp     KEY_GET
B_IO_INIT:              jmp     IO_INIT
B_VRAM_CLEAR_FULL:      jmp     VRAM_CLEAR_FULL
B_VRAM_CLEAR:           jmp     VRAM_CLEAR
B_COUT_NO_CC:           jmp     COUT_NO_CC
B_COUT:                 jmp     COUT
B_CHECK_SCROLL:         jmp     CHECK_SCROLL
B_SCROLL:               jmp     SCROLL

IRQ:
NMI:

.proc B_COLDSTART
        cld
        cli

        jsr VRAM_TEST
        jsr IO_INIT
        jsr VRAM_CLEAR_FULL
        lda #<MSG_VRAM_OK
        sta MSGL
        lda #>MSG_VRAM_OK
        sta MSGH
        jsr SHWMSG
        jsr BEEP
        jmp MON_COLDRESET
.endproc

.include "ewoz/ewoz.s"

.segment "VECTORS"

.addr NMI
.addr B_COLDSTART
.addr IRQ

.segment "RODATA"
MSG_VRAM_OK:    .byte "VRAM OK", $0D, $0D, $00