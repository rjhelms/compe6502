        .export _wherey
        .import _get_video_byte
        .include "compe.inc"

; unsigned char wherey (void)

_wherey:
        lda #$D9
        sta VIDEO_DATA
        jmp _get_video_byte

