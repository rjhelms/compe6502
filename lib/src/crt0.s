; crt0.s

; Startup code for cc65 (Compe version)
; based on example at https://cc65.github.io/doc/customizing.html

        .export _init, _exit
        .import _main

        .export __STARTUP__ : absolute = 1
        .import __RAM_START__, __RAM_SIZE__
        .import __STACKSIZE__

        .import copydata, zerobss, initlib, donelib

        .include "zeropage.inc"
        .include "compe.inc"
        .segment "STARTUP"

_init:      

; 6502 housekeeping
; does not include stack pointer initialization from example - want to preserve stack

        cld             ; clear decimal mode

; initialize cc65 stack pointer

        lda #<(__RAM_START__ + __RAM_SIZE__ + __STACKSIZE__)
        sta sp
        lda #>(__RAM_START__ + __RAM_SIZE__ + __STACKSIZE__)
        sta sp+1

; initialize memory storage

        jsr zerobss
        jsr copydata
        jsr initlib

; setup video for conio
        lda #$0A        ; put out a single new line
        sta VIDEO_DATA
        lda #$03        ; exit text mode
        sta VIDEO_DATA
        lda #$F8        ; disable cursor
        sta VIDEO_DATA

; call main()
        jsr _main

; back from main (this is also the _exit entry)
; return from subroutine (ie back to ewoz)

_exit:  jsr donelib     ; run destructors
        lda #$F9        ; enable cursor
        sta VIDEO_DATA
        lda #$02        ; return to text mode
        sta VIDEO_DATA
        rts
