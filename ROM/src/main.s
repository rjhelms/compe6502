.PC02

.include "../tmp/rom_ver.inc"
.include "asminc/zeropage.inc"

CHK_BYTE = <ROM_VER ^ >ROM_VER
.out .string(<CHK_BYTE)

.importzp       XAML, XAMH, STL, STH, L, H, YSAV, MODE, MSGL, MSGH, COUNTER
.importzp       COUNTER, CRC, CRCCHECK

.import         NMIVEC0, BRKVEC0, IRQVEC0, BRKRET0, IRQRET0, PWR_UP
.import         VECT_TAB_START, VECT_TAB_END

.import         PRSTATUS

.import         MEM_TEST
.import         VRAM_TEST

VECT_TAB_LEN    = VECT_TAB_START - VECT_TAB_END

.export         IRQ_VECTOR, NMI_VECTOR

.segment "SYS"
RESERVE:
        rts

.segment "BIOS"

.macro  jumptable LBL, DEST
        .global DEST
        LBL:            jmp     DEST
        .export LBL
.endmacro

; jump table for BIOS functions

jumptable       M_COLDRESET,            MON_COLDRESET
jumptable       M_WARMRESET,            MON_WARMRESET
jumptable       M_PRBYTE,               PRBYTE
jumptable       B_Reserve03,            RESERVE
jumptable       B_Reserve04,            RESERVE
jumptable       B_Reserve05,            RESERVE
jumptable       B_Reserve06,            RESERVE
jumptable       B_Reserve07,            RESERVE
jumptable       B_Reserve08,            RESERVE
jumptable       B_Reserve09,            RESERVE
jumptable       B_Reserve10,            RESERVE
jumptable       B_Reserve11,            RESERVE
jumptable       B_Reserve12,            RESERVE
jumptable       B_Reserve13,            RESERVE
jumptable       B_Reserve14,            RESERVE
jumptable       B_Reserve15,            RESERVE
jumptable       B_CSAVE,                CSAVE
jumptable       B_CLOAD,                CLOAD
jumptable       B_CPUTBYTE,             CPUTBYTE
jumptable       B_CGETBYTE,             CGETBYTE
jumptable       B_SHOWMSG,              SHWMSG
jumptable       B_BEEP,                 BEEP
jumptable       B_KEY_READ,             KEY_READ
jumptable       B_KEY_GET,              KEY_GET
jumptable       B_IO_INIT,              IO_INIT
jumptable       B_VRAM_CLEAR_FULL,      VRAM_CLEAR_FULL
jumptable       B_VRAM_CLEAR,           VRAM_CLEAR
jumptable       B_COUT_NO_CC,           COUT_NO_CC
jumptable       B_COUT,                 B_COUT
jumptable       B_CHECK_SCROLL,         CHECK_SCROLL
jumptable       B_SCROLL,               SCROLL

.export B_COLDSTART

.proc B_COLDSTART
        cld
        cli

        jsr IO_INIT

        lda PWR_UP      ; check power up byte
        cmp #CHK_BYTE
        bne :+
        jmp MON_WARMRESET       ; if set, go to warm reset
                                ; otherwise, continue with startup
:       jsr VRAM_TEST
        jsr VRAM_CLEAR_FULL
        lda #<MSG_VRAM_OK
        sta MSGL
        lda #>MSG_VRAM_OK
        sta MSGH
        jsr SHWMSG

        lda #<MSG_MEM_TEST
        sta MSGL
        lda #>MSG_MEM_TEST
        sta MSGH
        jsr SHWMSG

        jsr MEM_TEST

        ldy #$00        ; load vector table
VECT_SET:
        lda VEC_DATA, Y
        sta NMIVEC0, Y
        iny
        cpy #<VECT_TAB_LEN
        bne VECT_SET

        lda #<MSG_MEM_ROM_VER
        sta MSGL
        lda #>MSG_MEM_ROM_VER
        sta MSGH
        jsr SHWMSG

        lda PWR_UP      ; display magic byte
        jsr PRBYTE

        LDA #<MSG_WELCOME
        STA MSGL
        LDA #>MSG_WELCOME
        STA MSGH
        JSR SHWMSG      ;* Show Welcome.

        jmp MON_COLDRESET
.endproc

; hard vector for IRQ
.proc IRQ_VECTOR
        pha             ; stash registers on stack
        phx
        phy
        tsx
        lda $0100+4, X  ; check stack for a BRK
        and #$10
        bne DO_BRK
        jmp (IRQVEC0)   ; if not break, call IRQ soft vector
DO_BRK:                 ; else, call BRK soft vector
        jmp (BRKVEC0)
.endproc
        
; NMI hard vector - just calls NMI soft vector
.proc NMI_VECTOR
        jmp (NMIVEC0)
.endproc

; default IRQ return vector
.proc IRQ_RETURN
        ply
        plx
        pla
        rti
.endproc

; default IRQ soft vector - just returns
.proc IRQ_DEFAULT
        jmp (IRQRET0)
.endproc

; default BRK vector - print registers and drop to monitor
.proc BRK_DEFAULT
        ply             ; load registers from stack
        plx             ; and store on 0 page
        pla
        sta AREG
        stx XREG
        sty YREG
        pla
        sta PREG
        tsx             ; store stack pointer on 0 page
        stx SREG
        plx             ; pull program counter from stack
        stx PCL         ; and store on zero page
        ply
        sty PCH
        jsr PRSTATUS
        jmp (BRKRET0)   ; jump to return vector
.endproc

.segment "RODATA"
MSG_VRAM_OK:    .byte "VRAM OK", $0D, $00
MSG_MEM_TEST:   .byte "RAM TEST ", $00
MSG_MEM_ROM_VER:
                .byte "ROM CHECKSUM ", $00
MSG_WELCOME:
        .byte $0D
        .byte $C9, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $BB, $0D
        .byte $BA, " Comp", $82, "6502 ", $BA, $0D
        .byte $C8, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $BC, $0D, $0D, 0
VEC_DATA:
        .addr BRK_DEFAULT       ; NMIVEC0
        .addr BRK_DEFAULT       ; BRKVEC0
        .addr IRQ_DEFAULT       ; IRQVEC0
        .addr MON_WARMRESET     ; NMIRET0
        .addr MON_WARMRESET     ; BRKRET0
        .addr IRQ_RETURN        ; IRQRET0
        .byte CHK_BYTE          ; PWR_UP