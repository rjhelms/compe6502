.PC02

.struct DIR
    index       .word
    fn          .byte 12
    sclust      .word
    clust       .word
    sect        .dword
.endstruct

.import _B_COUT, _B_SHOWMSG
.import _B_PF_MOUNT, _B_PF_OPEN, _B_PF_READ
.import _M_PRBYTE
.import _br
.import _dj

STL     = $04
STH     = $05
MSGL    = $0A
MSGH    = $0B
_dst    = $19
_src    = $1B

.segment "CODE"
.proc main
        lda #$0A
        jsr _B_COUT
        jsr _B_PF_MOUNT         ; first thing, mount
        beq :+
        lda #<msg_no_disk
        sta MSGL
        lda #>msg_no_disk
        sta MSGH
        jmp fail

:       lda #<filename          ; copy file name to _dj memory
        sta _src
        lda #>filename
        sta _src+1
        lda #<(_dj+DIR::fn)
        sta _dst
        lda #>(_dj+DIR::fn)
        sta _dst+1
        lda #$0B
        sta _br
        stz _br+1
        jsr memcpy

        jsr _B_PF_OPEN          ; open the file
        beq :+
        lda #<msg_non_system
        sta MSGL
        lda #>msg_non_system
        sta MSGH
        jmp fail

:       jsr _B_PF_READ          ; read first block
        beq :+
        lda #<msg_read_error
        sta MSGL
        lda #>msg_read_error
        sta MSGH
        jmp fail

:       lda $0400       ; read program header from first block
        sta _dst        ; start address for memcopy
        sta STL         ; start address for program execution
        lda $0401
        sta _dst+1
        sta STH

        lda #$02        ; source address for first block program data is $0402
        sta _src
        lda #$04
        sta _src+1

        lda _br         ; subtract two from br for first block
        sec
        sbc #2
        sta _br
        bcs :+
        dec _br+1

:       jsr memcpy      ; copy first block

read_loop:
        jsr _B_PF_READ          ; attempt to read a block
        beq :+
        lda #<msg_read_error
        sta MSGL
        lda #>msg_read_error
        sta MSGH
        jmp fail

:       lda _br         ; check size of block returned
        ora _br+1
        beq @done       ; if 0, read is complete
        stz _src        ; otherwise, continue block copy from $0400...
        lda #$04
        sta _src+1
        jsr memcpy
        jmp read_loop   ; ... and go again

@done:
        jmp (STL)       ; jump to loaded program
fail:
        jsr _B_SHOWMSG  ; display error message &
        rts             ; return to monitor
.endproc

.proc memcpy
        ldy #$00

loop:   lda _br
        bne :+
        lda _br+1
        beq @done
        dec _br+1
:       dec _br

        lda (_src), Y
        sta (_dst), Y
        inc _src
        bne :+
        inc _src+1
:       inc _dst
        bne :+
        inc _dst+1

:       jmp loop
@done:  rts
.endproc

.segment "RODATA"
filename:
        .asciiz "HELLO      "
msg_no_disk:
        .byte "No disk or file system error", $0A, $00
msg_non_system:
        .byte "Non-System disk or disk error", $0A, $00
msg_read_error:
        .byte "File read error", $0A, $00
