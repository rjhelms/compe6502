; Extensions to eWoz

.include "asminc/zeropage.inc"

.import PRBYTE, SHWMSG
.import BEEP, COUT

.segment "ZEROPAGE"
; additional pointers for processor registers etc

AREG:   .res 1
XREG:   .res 1
YREG:   .res 1
PREG:   .res 1
SREG:   .res 1
PCL:    .res 1
PCH:    .res 1

.macro show_register reg
.scope
        @val := .ident(.sprintf("MSG_%s", .string(reg)))
        lda #<@val
        sta MSGL
        lda #>@val
        sta MSGH
        jsr SHWMSG
        lda reg
        jsr PRBYTE
.endscope
.endmacro

.segment "CODE"

.export PRSTATUS

.proc PRSTATUS
        lda #$0D
        jsr COUT
        jsr BEEP
        lda PCH
        jsr PRBYTE
        lda PCL
        jsr PRBYTE
        show_register AREG
        show_register XREG
        show_register YREG
        show_register SREG
        show_register PREG
        lda #$0D
        jmp COUT
.endproc

.segment "RODATA"
MSG_AREG:       .byte " A=",0
MSG_XREG:       .byte " X=",0
MSG_YREG:       .byte " Y=",0
MSG_SREG:       .byte " S=",0
MSG_PREG:       .byte " P=",0
