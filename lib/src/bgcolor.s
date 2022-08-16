        .export _bgcolor
        .import _get_video_byte
        .include "compe.inc"

; unsigned char __fastcall__ bgcolor (unsigned char color);

_bgcolor:
        pha             ; push desired bg to stack
        lda #$E5        ; get current bg - will be waiting in the buffer
        sta VIDEO_DATA
        lda #$E1        ; set bg
        sta VIDEO_DATA
        pla             ; pop desired bg and send
        sta VIDEO_DATA
        lda #$E3        ; apply bg to whole screen (per conio spec)
        sta VIDEO_DATA
        jmp _get_video_byte     ; return by way of get_video_byte which will
                                ; pull the byte requested above
