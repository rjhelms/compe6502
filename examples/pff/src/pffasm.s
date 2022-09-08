.PC02

.macro shift_left_16 addr
    asl addr
    rol addr+1
.endmacro

.macro print_a
    pha
    pha
    lda #$D0
    sta $B801
    pla
    sta $B801
    lda #$D6
    sta $B801
    pla
.endmacro

.macro print addr
    lda #$D0
    sta $B801
    lda addr
    sta $B801
    lda #$D6
    sta $B801
.endmacro

.macro print_zpy addr
    lda #$D0
    sta $B801
    lda (addr),y
    sta $B801
    lda #$D6
    sta $B801
.endmacro

.macpack longbranch


; structs & unions

.struct FATFS
    fs_type     .byte
    flag        .byte
    csize       .byte
    pad1        .byte
    n_rootdir   .word
    n_fatent    .word
    fatbase     .dword
    dirbase     .dword
    database    .dword
    fptr        .dword
    fsize       .dword
    org_clust   .word
    curr_clust  .word
    dsect       .word
.endstruct

.struct DIR
    index       .word
    fn          .byte 12
    sclust      .word
    clust       .word
    sect        .dword
.endstruct

.union CLST
    mclst       .dword
    clst        .word
    sect        .dword
.endunion

; constants

_buff = $0400

; file return results

FR_OK               = $00
FR_DISK_ERR         = $01
FR_NOT_READY        = $02
FR_NO_FILE          = $03
FR_NOT_OPENED       = $04
FR_NOT_ENABLED      = $05
FR_NO_FILESYSTEM    = $06

; file status flag
FA_OPENED   = $01
FA_WPRT     = $02
FA__WIP     = $40

; fat sub types
FS_FAT12 = 1
FS_FAT16 = 2
FS_FAT32 = 3

; file attributes
AM_RDO  = $01   ; read only
AM_HID  = $02   ; hidden
AM_SYS  = $04   ; system
AM_VOL  = $08   ; volume label
AM_LFN  = $0F   ; LFN entry
AM_DIR  = $10   ; directory
AM_ARC  = $20   ; archive
AM_MASK = $3F   ; mask of defined bits

; boot sector offsets
BS_FilSysType = 54

; directory entry offsets
DIR_Attr = 11
DIR_FstClusLO = 26
DIR_FileSize = 28

.global _FatFs
.global _dj
.global _btr
.global _br
.global _clst

.globalzp _dst
.globalzp _src

.global _offset
.global _count
.global _sector
.global _result

.import _disk_readp
.import _work

.export _pf_open

.export _check_fs
.export _clust2sect
.export _dir_find
.export _dir_rewind
.export _dir_next
.export _get_fat
.export _mem_cmp

.segment "ZEROPAGE"
    _dst: .res 2
    _src: .res 2

.segment "BSS"
    _FatFs: .tag FATFS
    _dj: .tag DIR
    _btr: .res 2, $00
    _br: .res 2, $00
    _clst: .tag CLST
    _add_tmp: .res 4, $00

.segment "CODE"

; unsigned char pf_open()
; open a file

.proc _pf_open
    lda _FatFs+FATFS::fs_type   ; check file system loaded
    bne :+
    lda #FR_NOT_ENABLED
    rts

:   stz _FatFs+FATFS::flag      ; zero out status flag
    jsr _dir_find               ; follow the file path
    sta _result
    beq :+                      ; if result >0, return error
    rts

:   lda _buff
    beq @file_is_dir
    lda _buff+DIR_Attr
    and AM_DIR
    beq @file_ok

@file_is_dir:
    lda #FR_NO_FILE
    rts

@file_ok:
    lda _buff+DIR_FstClusLO     ; start cluster
    sta _FatFs+FATFS::org_clust
    lda _buff+DIR_FstClusLO+1
    sta _FatFs+FATFS::org_clust+1

    lda _buff+DIR_FileSize      ; file size
    sta _FatFs+FATFS::fsize
    lda _buff+DIR_FileSize+1
    sta _FatFs+FATFS::fsize+1
    lda _buff+DIR_FileSize+2
    sta _FatFs+FATFS::fsize+2
    lda _buff+DIR_FileSize+3
    sta _FatFs+FATFS::fsize+3

    stz _FatFs+FATFS::fptr      ; file pointer (to start of file)
    stz _FatFs+FATFS::fptr+1
    stz _FatFs+FATFS::fptr+2
    stz _FatFs+FATFS::fptr+3

    lda #FA_OPENED
    sta _FatFs+FATFS::flag
    lda #FR_OK
    rts
.endproc

; unsigned char check_fs()
; Check a sector if it is an FAT boot record
;
; 0 - FAT boot record
; 1 - valid non-FAT boot record
; 2 - not a boot record
; 3 - error
;
; TODO: do this in one read of the boot sector

.proc _check_fs
    lda #$FE            ; read signature bytes at $01FE
    sta _offset
    lda #$01
    sta _offset+1
    lda #$02
    sta _count
    stz _count+1
    jsr _disk_readp

    beq :+              ; continue if 0 returned from _disk_readp
    lda #$03            ; else return with 3 (error)
    rts

:   lda _buff           ; check for $AA55 in buffer
    cmp #$55
    bne @invalid_sig
    lda _buff+1
    cmp #$AA
    beq @valid_sig

@invalid_sig:           ; if not found
    lda #$02            ; return with 2 (not boot sector)
    rts

@valid_sig:             ; else continue
    lda #<BS_FilSysType ; read system identifier
    sta _offset
    lda #>BS_FilSysType
    sta _offset+1
    lda #$02
    sta _count
    stz _count+1
    jsr _disk_readp
    bne @not_fat

    lda _buff           ; check for FAT identifier
    cmp #$46            ; "F"
    bne @not_fat
    lda _buff+1
    cmp #$41            ; "A"
    bne @not_fat

    lda #$00            ; return 0 if found
    rts

@not_fat:
    lda #$01            ; else, valid non-FAT boot sector
    rts
.endproc

; void clust2sect()
; Get sector# from cluster#
;
; returns result in clst.sect
;
; 0 - failed, invalid cluster#
; >1 - sector number

.proc _clust2sect
    ; clst < n_fatent
    lda _clst+1                     ; compate clst w/ # fat entries
    cmp _FatFs+FATFS::n_fatent+1    ; high byte first
    bcc @clst_good
    lda _clst
    cmp _FatFs+FATFS::n_fatent
    bcc @clst_good

    stz _clst
    stz _clst+1
    stz _clst+2
    stz _clst+3

@clst_good:
    lda _clst                       ; clst = clst-2
    sec
    sbc #$02
    sta _clst
    bcs :+
    dec _clst+1

    lda _clst                       ; stash clst in temp var for multiplication
    sta _add_tmp
    lda _clst+1
    sta _add_tmp+1

    stz _clst                       ; zero clst
    stz _clst+1
    stz _clst+2
    stz _clst+3

    ldy _FatFs+FATFS::csize         ; multiple by csize

@add_csize_loop:
    clc                             ; loop of 16 bit adds with carry
    lda _clst
    adc _add_tmp
    sta _clst
    lda _clst+1
    adc _add_tmp+1
    sta _clst+1
    bcc :+
    inc _clst+2
:   dey
    bne @add_csize_loop

    clc                             ; add FatFs.database - 32 bit add
    lda _clst
    adc _FatFs+FATFS::database
    sta _clst
    lda _clst+1
    adc _FatFs+FATFS::database+1
    sta _clst+1
    lda _clst+2
    adc _FatFs+FATFS::database+2
    sta _clst+2
    lda _clst+3
    adc _FatFs+FATFS::database+3
    sta _clst+3

    rts
.endproc

; unsigned char dir_find()
; find an object in the directory

.proc _dir_find
    jsr _dir_rewind
    sta _result
    beq @loop
    rts     ; if result is anything other than FR_OK, return

@loop:
    lda _dj+DIR::sect
    sta _sector
    lda _dj+DIR::sect+1
    sta _sector+1
    lda _dj+DIR::sect+2
    sta _sector+2
    lda _dj+DIR::sect+3
    sta _sector+3

    lda _dj+DIR::index  ; offset = dj.index % 16
    and #$0F
    sta _offset
    stz _offset+1

    shift_left_16 _offset
    shift_left_16 _offset
    shift_left_16 _offset
    shift_left_16 _offset
    shift_left_16 _offset

    stz _count+1
    lda #$20
    sta _count

    jsr _disk_readp     ; read an entry
    beq :+
    lda #FR_DISK_ERR    ; if there's an error, return it
    sta _result
    rts

:   lda _buff           ; if buff[0] is null, return no file
    bne :+

    lda #FR_NO_FILE
    sta _result
    rts

:   lda #<_buff
    sta _dst
    lda #>_buff
    sta _dst+1
    lda #<(_dj+DIR::fn)
    sta _src
    lda #>(_dj+DIR::fn+1)
    sta _src+1
    lda #$08
    sta _work

    lda _buff+DIR_Attr  ; if not a volume entry
    and #AM_VOL
    bne :+
    jsr _mem_cmp        ; and the file we're looking for
    beq @return         ; return

:   jsr _dir_next       ; get next entry
    sta _result         ; keep going, provided no error
    jeq @loop

@return:
    lda _result
    rts
.endproc

; unsigned char dir_next()
; move directory index next
;
; FR_OK - succeeded, FR_NO_FILE - end of table

.proc _dir_next
    lda _dj+DIR::index      ; load and increment index
    ldx _dj+DIR::index+1
    clc
    adc #$01
    bcc :+
    inx
:   sta _work
    stx _work+1

    lda _work               ; if index or sect are 0
    ora _work+1             ; return error
    beq @end_of_table
    lda _dj+DIR::sect
    ora _dj+DIR::sect+1
    ora _dj+DIR::sect+2
    ora _dj+DIR::sect+3
    bne @in_table

@end_of_table:
    lda #FR_NO_FILE
    rts

@in_table:
    lda _work               ; check if sector aligned
    and #$0F
    jne @set_and_return     ; if not, we're done

    inc _dj+DIR::sect       ; increment sector
    bne :+
    inc _dj+DIR::sect+1
    bne :+
    inc _dj+DIR::sect+2
    bne :+
    inc _dj+DIR::sect+3

:   lda _dj+DIR::clust
    ora _dj+DIR::clust
    bne @dynamic_table

@static_table:
    lda _work               ; if work.i < FatFs.n_rootdir
    cmp _FatFs+FATFS::n_rootdir
    lda _work+1
    sbc _FatFs+FATFS::n_rootdir+1
    jcc @set_and_return     ; return 

    lda #FR_NO_FILE
    rts                     ; else report failure

@dynamic_table:
    lda _work               ; check if cluster changed
    sta _work+2             ; copy work.i to high word of work
    lda _work+1
    sta _work+3

    lsr _work+3             ; shift copy right 4 bits (div/16)
    ror _work+2
    lsr _work+3
    ror _work+2
    lsr _work+3
    ror _work+2
    lsr _work+3
    ror _work+2
    
    lda _FatFs+FATFS::csize ; csize -1 & work/16
    dec
    and _work+2
    bne @set_and_return     ; if cluster hasn't changed, finish up

    lda _dj+DIR::clust      ; get next cluster
    sta _clst
    lda _dj+DIR::clust+1
    sta _clst+1
    jsr _get_fat
    sta _dj+DIR::clust
    stx _dj+DIR::clust+1

    cpx #$00                ; fail if invalud
    bne :+
    cmp #$02
:   bcs :+

    lda #FR_DISK_ERR
    rts

:   lda _dj+DIR::clust      ; check if past end of table
    cmp _FatFs+FATFS::n_fatent
    lda _dj+DIR::clust+1
    sbc _FatFs+FATFS::n_fatent+1
    bcc :+

    lda #FR_NO_FILE         ; fail if so
    rts

:   lda _dj+DIR::clust      ; initialize data for new cluster
    sta _clst
    lda _dj+DIR::clust+1
    sta _clst+1
    jsr _clust2sect
    lda _clst
    sta _dj+DIR::sect
    lda _clst+1
    sta _dj+DIR::sect+1
    lda _clst+2
    sta _dj+DIR::sect+2
    lda _clst+3
    sta _dj+DIR::sect+3

@set_and_return:
    lda _work               ; store the incremented index
    ldx _work+1
    sta _dj+DIR::index
    stx _dj+DIR::index+1

    lda #FR_OK              ; return OK
    rts
.endproc

; unsigned char dir_rewind()
; rewind directory index

.proc _dir_rewind
    stz _dj+DIR::index
    stz _dj+DIR::index+1

    lda _dj+DIR::sclust+1
    bne :+
    lda _dj+DIR::sclust
    cmp #$01
    beq @disk_err
    lda _dj+DIR::sclust
    cmp _FatFs+FATFS::n_fatent
    lda _dj+DIR::sclust+1
    sbc _FatFs+FATFS::n_fatent
    bcc @disk_ok

@disk_err:
    lda #FR_DISK_ERR
    rts

@disk_ok:
    lda _dj+DIR::sclust
    sta _dj+DIR::clust
    sta _clst
    lda _dj+DIR::sclust+1
    sta _dj+DIR::clust+1
    sta _clst+1

    lda _dj+DIR::sclust
    ora _dj+DIR::sclust+1
    beq @sclust_zero

    jsr _clust2sect
    lda _clst
    sta _dj+DIR::sect
    lda _clst+1
    sta _dj+DIR::sect+1
    lda _clst+2
    sta _dj+DIR::sect+2
    lda _clst+3
    sta _dj+DIR::sect+3
    jmp @return

@sclust_zero:
    lda _FatFs+FATFS::dirbase
    sta _dj+DIR::sect
    lda _FatFs+FATFS::dirbase+1
    sta _dj+DIR::sect+1
    lda _FatFs+FATFS::dirbase+2
    sta _dj+DIR::sect+2
    lda _FatFs+FATFS::dirbase+3
    sta _dj+DIR::sect+3

@return:
    lda #FR_OK
    rts
.endproc

; unsigned int get_fat()
; FAT access - Read value of a FAT entry
;
; 1:IO error, Else:Cluster status

.proc _get_fat
    lda _clst+1
    cmp #$00
    bne :+
    lda _clst
    cmp #$02
:   jcc @return_error
    lda _clst
    cmp _FatFs+FATFS::n_fatent
    lda _clst+1
    sbc _FatFs+FATFS::n_fatent+1
    jcs @return_error

@range_good:
    lda _FatFs                      ; verify FAT16 partition
    cmp #$02
    bne @return_error

    lda _FatFs+FATFS::fatbase       ; sector = fatbase
    sta _sector
    lda _FatFs+FATFS::fatbase+1
    sta _sector+1
    lda _FatFs+FATFS::fatbase+2
    sta _sector+2
    lda _FatFs+FATFS::fatbase+3
    sta _sector+3

    clc                             ;sector += clst>>8
    lda _sector
    adc _clst+1
    sta _sector
    lda _sector+1                   ; this could be better
    adc #$00
    sta _sector+1                   ; check for carries rather than doing full
    lda _sector+2                   ; 32 bit add
    adc #$00
    sta _sector+2
    lda _sector+3
    adc #$00
    sta _sector+3

    stz _offset+1
    lda _clst                       ; offset = (clst%256)<<1
    sta _offset
    shift_left_16 _offset

    lda #$02                        ; count = 2
    sta _count
    lda #$00
    sta _count+1

    jsr _disk_readp                 ; read
    bne @return_error               ; return error if read error

    lda _buff                       ; else return bytes read
    ldx _buff+1
    rts

@return_error:
    lda #$01
    ldx #$00
    rts
.endproc

; unsigned char mem_cmp
; compare memory blocks

.proc _mem_cmp
    ldy _work
@loop:
    dey
    lda (_dst),y
    cmp (_src),y
    beq :+

    lda #$01
    rts

:   cpy #$00
    bne @loop

    tya
    rts
.endproc
