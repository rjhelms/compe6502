        .export screensize
        .import _get_video_byte
        .include "compe.inc"

screensize:
        lda #$DA
        sta VIDEO_DATA
        jsr _get_video_byte
        tax
        
        lda #$DB
        sta VIDEO_DATA
        jsr _get_video_byte
        tay
        rts
