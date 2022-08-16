        .export _textcolor
        .import _get_video_byte
        .include "compe.inc"

; unsigned char __fastcall__ textcolor (unsigned char color);

_textcolor:
        pha             ; push desired fg to stack
        lda #$E4        ; get current fg - will be waiting in the buffer
        sta VIDEO_DATA
        lda #$E0        ; set fg
        sta VIDEO_DATA
        pla             ; pop desired fg and send
        sta VIDEO_DATA
        jmp _get_video_byte     ; return by way of get_video_byte which will
                                ; pull the byte requested above
