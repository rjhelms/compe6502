; unsigned char get_video_byte (void)

        .include "compe.inc"
        .export _get_video_byte

_get_video_byte:
        bit VIDEO_STATUS
        bvc _get_video_byte
        lda VIDEO_DATA
        rts
