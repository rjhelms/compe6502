.PC02

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


; structs

.struct FATFS
    fs_type     .byte
    flag        .byte
    csize       .byte
    pad1        .byte
    n_rootdir   .word
    n_fatend    .word
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

; constants

_buff = $0400

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

.global _FatFs
.global _dj
.global _btr
.global _br
.global _offset
.global _count

.import _disk_readp

.export _check_fs

.segment "BSS"
    _FatFs: .tag FATFS
    _dj: .tag DIR
    _btr: .res 2, $00
    _br: .res 2, $00

.segment "CODE"

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
