; char cpeekc (void);

        .export _cpeekc
        .import _get_video_byte
        .include "compe.inc"

_cpeekc:
        lda #$D1
        sta VIDEO_DATA
        jmp _get_video_byte
