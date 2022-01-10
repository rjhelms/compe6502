		.segment "HEADER"
.ifdef KBD
        jmp     LE68C
        .byte   $00,$13,$56
.endif
.ifdef AIM65
        jmp     COLD_START
        jmp     RESTART
        .word   AYINT,GIVAYF
.endif
.ifdef SYM1
        jmp     PR_WRITTEN_BY
.endif
.ifdef COMPE
BASIC_COLD:
        jmp     COLD_START
BASIC_WARM:
        jmp     RESTART
.export BASIC_COLD, BASIC_WARM
.endif