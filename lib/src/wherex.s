        .export _wherex
        .import _get_video_byte
        .include "compe.inc"

; unsigned char wherex (void);

_wherex:
        lda #$D8
        sta VIDEO_DATA
        jmp _get_video_byte

