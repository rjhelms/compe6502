        .include        "zeropage.inc"

        .include        "tgi-kernel.inc"
        .include        "tgi-error.inc"
        .include        "compe.inc"

        .import _get_video_byte

        .macpack        module

; Used for passing parameters to the driver

X1      :=      ptr1
Y1      :=      ptr2
X2      :=      ptr3
Y2      :=      ptr4

        module_header _compe_4bpp_tgi

; Header. Includes jump table and constants.

; First part of the header is a structure that has a magic and defines the
; capabilities of the driver

        .byte   $74, $67, $69   ; "tgi"
        .byte   TGI_API_VERSION ; TGI API version number
        .addr   $0000           ; Library reference
        .word   320             ; X resolution
        .word   192             ; Y resolution
        .byte   16              ; Number of drawing colors
        .byte   2               ; Number of screens available
        .byte   0               ; System font X size
        .byte   0               ; System font Y size
        .word   $00CC           ; Aspect ratio (based on 4/3 display)
        .byte   0               ; TGI driver flags

; Next comes the jump table. With the exception of IRQ, all entries must be
; valid and may point to an RTS for test versions (function not implemented).

        .addr   INSTALL
        .addr   UNINSTALL
        .addr   INIT
        .addr   DONE
        .addr   GETERROR
        .addr   CONTROL
        .addr   CLEAR
        .addr   SETVIEWPAGE
        .addr   SETDRAWPAGE
        .addr   SETCOLOR
        .addr   SETPALETTE
        .addr   GETPALETTE
        .addr   GETDEFPALETTE
        .addr   SETPIXEL
        .addr   GETPIXEL
        .addr   LINE
        .addr   BAR
        .addr   TEXTSTYLE
        .addr   OUTTEXT

; ------------------------------------------------------------------------

        .bss

ERROR:          .res    1       ; Error code
MIX:            .res    1       ; 4 lines of text

; ------------------------------------------------------------------------

        .rodata

DEFPALETTE:     .byte $00, $02, $14, $16, $A0, $A2, $A8, $B6
                .byte $49, $4B, $5D, $5F, $E9, $EB, $FD, $FF

; TGI needs BLACK and WHITE defined independent of driver, so we're stuck with
; 0 and 1 from the 1bpp driver. Byte swap shenanigans put white at index 1 in
; TGI while keeping it at 15 elsewhere.

TGI2COL:        .byte $00, $0F, $01, $02, $03, $05, $05, $06
                .byte $07, $08, $09, $0A, $0B, $0C, $0D, $0E

COL2TGI:        .byte $00, $02, $03, $04, $05, $06, $07, $08
                .byte $09, $0A, $0B, $0C, $0D, $0E, $0F, $01

; ------------------------------------------------------------------------

        .code

; INIT: Changes an already installed device from text mode to graphics mode.
; Note that INIT/DONE may be called multiple times while the driver
; is loaded, while INSTALL is only called once, so any code that is needed
; to initializes variables and so on must go here. Setting palette and
; clearing the screen is not needed because this is called by the graphics
; kernel later.
; The graphics kernel will never call INIT when a graphics mode is already
; active, so there is no need to protect against that.
; Must set an error code: YES

INIT:
        ; switch into graphics mode
        lda #$F6
        sta VIDEO_DATA

        ; done, reset the error code
        lda #TGI_ERR_OK
        sta ERROR

        ; fall through

; INSTALL routine. Is called after the driver is loaded into memory. May
; initialize anything that has to be done just once. Is probably empty
; most of the time.
; Must set an error code: NO
INSTALL:
        ; Fall through

; UNINSTALL routine. Is called before the driver is removed from memory. May
; clean up anything done by INSTALL but is probably empty most of the time.
; Must set an error code: NO
UNINSTALL:
        ; Fall through

; TEXTSTYLE: Set the style used when calling OUTTEXT. Text scaling in X and Y
; direction is passend in X/Y, the text direction is passed in A.
; Must set an error code: NO
TEXTSTYLE:
        ; Fall through

; OUTTEXT: Output text at X/Y = ptr1/ptr2 using the current color and the
; current text style. The text to output is given as a zero terminated
; string with address in ptr3.
; Must set an error code: NO
OUTTEXT:
        rts

; DONE: Will be called to switch the graphics device back into text mode.
; The graphics kernel will never call DONE when no graphics mode is active,
; so there is no need to protect against that.
; Must set an error code: NO
DONE:
        lda #$F0        ; 40 column text mode
        sta VIDEO_DATA
        lda #$FE        ; clear screen
        sta VIDEO_DATA
        rts

; GETERROR: Return the error code in A and clear it.
GETERROR:
        lda ERROR
        ldx #TGI_ERR_OK
        stx ERROR
        rts

; CONTROL: Platform/driver specific entry point.
; Must set an error code: YES
CONTROL:
        lda #TGI_ERR_OK ; for now, just do nothing and say OK lol
        sta ERROR
        rts

; CLEAR: Clears the screen.
; Must set an error code: NO
CLEAR:
        lda #$FE
        sta VIDEO_DATA
        rts

; SETVIEWPAGE: Set the visible page. Called with the new page in A (0..n).
; The page number is already checked to be valid by the graphics kernel.
; Must set an error code: NO (will only be called if page ok)
SETVIEWPAGE:
        clc
        adc #$CC
        sta VIDEO_DATA
        rts

; SETDRAWPAGE: Set the drawable page. Called with the new page in A (0..n).
; The page number is already checked to be valid by the graphics kernel.
; Must set an error code: NO (will only be called if page ok)
SETDRAWPAGE:
        clc
        adc #$CE
        sta VIDEO_DATA
        rts

; SETCOLOR: Set the drawing color (in A). The new color is already checked
; to be in a valid range (0..maxcolor-1).
; Must set an error code: NO (will only be called if color ok)
SETCOLOR:
        tax
        lda #$B0
        sta VIDEO_DATA
        lda TGI2COL, x  ; convert to Pico color
        sta VIDEO_DATA
        rts

; TODO: implement set and get palette

; SETPALETTE: Set the palette (not available with all drivers/hardware).
; A pointer to the palette is passed in ptr1. Must set an error if palettes
; are not supported
; Must set an error code: YES
SETPALETTE:
        lda #TGI_ERR_INV_FUNC
        sta ERROR
        rts

; GETPALETTE: Return the current palette in A/X. Even drivers that cannot
; set the palette should return the default palette here, so there's no
; way for this function to fail.
; Must set an error code: NO
GETPALETTE:
        ; Fall through

; GETDEFPALETTE: Return the default palette for the driver in A/X. All
; drivers should return something reasonable here, even drivers that don't
; support palettes, otherwise the caller has no way to determine the colors
; of the (not changeable) palette.
; Must set an error code: NO (all drivers must have a default palette)
GETDEFPALETTE:
        lda #<DEFPALETTE
        ldx #>DEFPALETTE
        rts

; SETPIXEL: Draw one pixel at X1/Y1 = ptr1/ptr2 with the current drawing
; color. The coordinates passed to this function are never outside the
; visible screen area, so there is no need for clipping inside this function.
; Must set an error code: NO
SETPIXEL:
        lda #$B2
        sta VIDEO_DATA
        lda X1
        sta VIDEO_DATA
        lda X1+1
        sta VIDEO_DATA
        lda Y1
        sta VIDEO_DATA
        lda Y1+1
        sta VIDEO_DATA
        rts

; GETPIXEL: Read the color value of a pixel and return it in A/X. The
; coordinates passed to this function are never outside the visible screen
; area, so there is no need for clipping inside this function.
GETPIXEL:
        lda #$B3
        sta VIDEO_DATA
        lda X1
        sta VIDEO_DATA
        lda X1+1
        sta VIDEO_DATA
        lda Y1
        sta VIDEO_DATA
        lda Y1+1
        sta VIDEO_DATA
        jsr _get_video_byte

        tax             ; convert to TGI color
        lda COL2TGI, x
        ldx #$00
        rts

; LINE: Draw a line from X1/Y1 to X2/Y2, where X1/Y1 = ptr1/ptr2 and
; X2/Y2 = ptr3/ptr4 using the current drawing color.
; Must set an error code: NO
LINE:
        lda #$B4
        sta VIDEO_DATA
        lda X1
        sta VIDEO_DATA
        lda X1+1
        sta VIDEO_DATA
        lda Y1
        sta VIDEO_DATA
        lda Y1+1
        sta VIDEO_DATA
        lda X2
        sta VIDEO_DATA
        lda X2+1
        sta VIDEO_DATA
        lda Y2
        sta VIDEO_DATA
        lda Y2+1
        sta VIDEO_DATA
        rts

; BAR: Draw a filled rectangle with the corners X1/Y1, X2/Y2, where
; X1/Y1 = ptr1/ptr2 and X2/Y2 = ptr3/ptr4 using the current drawing color.
; Contrary to most other functions, the graphics kernel will sort and clip
; the coordinates before calling the driver, so on entry the following
; conditions are valid:
;       X1 <= X2
;       Y1 <= Y2
;       (X1 >= 0) && (X1 < XRES)
;       (X2 >= 0) && (X2 < XRES)
;       (Y1 >= 0) && (Y1 < YRES)
;       (Y2 >= 0) && (Y2 < YRES)
; Must set an error code: NO
BAR:
        lda #$B5
        sta VIDEO_DATA
        lda X1
        sta VIDEO_DATA
        lda X1+1
        sta VIDEO_DATA
        lda Y1
        sta VIDEO_DATA
        lda Y1+1
        sta VIDEO_DATA
        lda X2
        sta VIDEO_DATA
        lda X2+1
        sta VIDEO_DATA
        lda Y2
        sta VIDEO_DATA
        lda Y2+1
        sta VIDEO_DATA
        rts
