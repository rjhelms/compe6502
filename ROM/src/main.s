.debuginfo + 

.PC02
ROM_VER = $00
CHK_BYTE = ROM_VER ^ $A5

.include "slot_defs.inc"
.include "io_card.s"
.include "video.s"
.include "memtest.s"
.include "vectors.s"

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

.proc B_COLDSTART
        cld
        cli

        jsr IO_INIT

        lda PWR_UP      ; check power up byte
        cmp #CHK_BYTE
        bne :+
        jmp M_WARMRESET ; if set, go to warm reset
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
        cpy #VEC_TAB_LEN
        bne VECT_SET

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
        lda #$0D
        jsr COUT
        jsr BEEP
        ldy #$07        ; output in reverse order
:       lda AREG, Y
        jsr PRBYTE
        dey
        bne :-
        jmp (BRKRET0)   ; jump to return vector
.endproc

.include "ewoz/ewoz.s"

.segment "RODATA"
MSG_VRAM_OK:    .byte "VRAM OK", $0D, $00
MSG_MEM_TEST:   .byte "RAM TEST ", $00

VEC_DATA:
        .addr BRK_DEFAULT       ; NMIVEC0
        .addr BRK_DEFAULT       ; BRKVEC0
        .addr IRQ_DEFAULT       ; IRQVEC0
        .addr MON_WARMRESET     ; NMIRET0
        .addr MON_WARMRESET     ; BRKRET0
        .addr IRQ_RETURN        ; IRQRET0
        .byte CHK_BYTE          ; PWR_UP