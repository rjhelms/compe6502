; EWoz 1.0
; by fsafstrom » Mar Wed 14, 2007 12:23 pm
; http://www.brielcomputers.com/phpBB3/viewtopic.php?f=9&t=197#p888
; via http://jefftranter.blogspot.co.uk/2012/05/woz-mon.html
; via https://gist.github.com/BigEd/2760560

; adapted to ca65 and Compe6502 by Rob Hailman 2021

; TODO: figure out the shenanigans about the high byte - do I need any of this?

.segment "BSS"
IN:         .res 256    ;*Input buffer

.segment "ZEROPAGE"
XAML:       .res 1      ;*Index pointers
XAMH:       .res 1        
STL:        .res 1
STH:        .res 1
L:          .res 1
H:          .res 1
YSAV:       .res 1
MODE:       .res 1
MSGL:       .res 1
MSGH:       .res 1
COUNTER:    .res 1
CRC:        .res 1
CRCCHECK:   .res 1

.segment "MON"
MON_COLDRESET:
        LDA #<MSG_MON_WELCOME
        STA MSGL
        LDA #>MSG_MON_WELCOME
        STA MSGH
        JSR SHWMSG      ;* Show Welcome.
MON_WARMRESET: 
        LDA #$9B        ;* Auto escape.
NOTCR:  
        CMP #$88        ;"<-"? * Note this was chaged to $88 which is the back
                        ;        space key.
        BEQ BACKSPACE   ;Yes.
        CMP #$9B        ;ESC?
        BEQ ESCAPE      ;Yes.
        INY             ;Advance text index.
        BPL NEXTCHAR    ;Auto ESC if >127.
ESCAPE: 
        LDA #$DC        ;"\"
        JSR ECHO        ;Output it.
GETLINE:
        LDA #$8D        ;CR.
        JSR ECHO        ;Output it.
        LDY #$01        ;Initiallize text index.
BACKSPACE: 
        DEY             ;Backup text index.
        BMI GETLINE     ;Beyond start of line, reinitialize.
        LDA #$A0        ;*Space, overwrite the backspaced char.
        JSR ECHO
        LDA #$88        ;*Backspace again to get to correct pos.
        JSR ECHO
NEXTCHAR:
        LDA #$B1        ; rjh - NEXTCHAR adapted for VIA input    
        STA (SCREEN_PTR)    ; draw a cursor
@WAIT: 
        JSR KEY_GET     ; rjh - wait for a character
        CMP #$60        ;*Is it Lower case
        BMI CONVERT     ;*Nope, just convert it
        AND #$5F        ;*If lower case, convert to Upper case
CONVERT:    
        ORA #$80        ;*Convert it to "ASCII Keyboard" Input
        STA IN,Y        ;Add to text buffer.
        JSR ECHO        ;Display character.
        CMP #$8D        ;CR?
        BNE NOTCR       ;No.
        LDY #$FF        ;Reset text index.
        LDA #$00        ;For XAM mode.
        TAX             ;0->X.
SETSTOR:    
        ASL             ;Leaves $7B if setting STOR mode.
SETMODE:    
        STA MODE        ;$00 = XAM, $7B = STOR, $AE = BLOK XAM.
BLSKIP:
        INY             ;Advance text index.
NEXTITEM:
        LDA IN,Y        ;Get character.
        CMP #$8D        ;CR?
        BEQ GETLINE     ;Yes, done this line.
        CMP #$AE        ;"."?
        BCC BLSKIP      ;Skip delimiter.
        BEQ SETMODE     ;Set BLOCK XAM mode.
        CMP #$BA        ;":"?
        BEQ SETSTOR     ;Yes, set STOR mode.
        CMP #$D2        ;"R"?
        BEQ RUN         ;Yes, run user program.
        CMP #$CC        ;* "L"?
        BEQ LOADINT     ;* Yes, Load Intel Code.
        STX L           ;$00->L.
        STX H           ; and H.
        STY YSAV        ;Save Y for comparison.
NEXTHEX:    
        LDA IN,Y        ;Get character for hex test.
        EOR #$B0        ;Map digits to $0-9.
        CMP #$0A        ;Digit?
        BCC DIG         ;Yes.
        ADC #$88        ;Map letter "A"-"F" to $FA-FF.
        CMP #$FA        ;Hex letter?
        BCC NOTHEX      ;No, character not hex.
DIG:    
        ASL
        ASL             ;Hex digit to MSD of A.
        ASL
        ASL
        LDX #$04        ;Shift count.
HEXSHIFT:   
        ASL             ;Hex digit left MSB to carry.
        ROL L           ;Rotate into LSD.
        ROL H           ;Rotate into MSD's.
        DEX             ;Done 4 shifts?
        BNE HEXSHIFT    ;No, loop.
        INY             ;Advance text index.
        BNE NEXTHEX     ;Always taken. Check next character for hex.
NOTHEX:     
        CPY YSAV        ;Check if L, H empty (no hex digits).
        BNE NOESCAPE   ;* Branch out of range, had to improvise...
        JMP ESCAPE      ;Yes, generate ESC sequence.

RUN:
        JSR ACTRUN      ;* JSR to the Address we want to run.
        JMP MON_WARMRESET   ;* When returned for the program, reset EWOZ.
ACTRUN:
        JMP (XAML)      ;Run at current XAM index.

LOADINT:
        JSR LOADINTEL   ;* Load the Intel code.
        JMP MON_WARMRESET   ;* When returned from the program, reset EWOZ.

NOESCAPE:
        BIT MODE        ;Test MODE byte.
        BVC NOTSTOR     ;B6=0 for STOR, 1 for XAM and BLOCK XAM
        LDA L           ;LSD's of hex data.
        STA (STL, X)    ;Store at current "store index".
        INC STL         ;Increment store index.
        BNE NEXTITEM    ;Get next item. (no carry).
        INC STH         ;Add carry to 'store index' high order.
TONEXTITEM:
        JMP NEXTITEM    ;Get next command item.
NOTSTOR:
        BMI XAMNEXT     ;B7=0 for XAM, 1 for BLOCK XAM.
        LDX #$02        ;Byte count.
SETADR:
        LDA L-1,X       ;Copy hex data to
        STA STL-1,X     ;"store index".
        STA XAML-1,X    ;And to "XAM index'.
        DEX             ;Next of 2 bytes.
        BNE SETADR      ;Loop unless X = 0.
NXTPRNT:
        BNE PRDATA      ;NE means no address to print.
        LDA #$8D        ;CR.
        JSR ECHO        ;Output it.
        LDA XAMH        ;'Examine index' high-order byte.
        JSR PRBYTE      ;Output it in hex format.
        LDA XAML        ;Low-order "examine index" byte.
        JSR PRBYTE      ;Output it in hex format.
        LDA #$BA        ;":".
        JSR ECHO        ;Output it.
PRDATA:
        LDA #$A0        ;Blank.
        JSR ECHO        ;Output it.
        LDA (XAML,X)    ;Get data byte at 'examine index".
        JSR PRBYTE      ;Output it in hex format.
XAMNEXT:
        STX MODE        ;0-> MODE (XAM mode).
        LDA XAML
        CMP L           ;Compare 'examine index" to hex data.
        LDA XAMH
        SBC H
        BCS TONEXTITEM  ;Not less, so no more data to output.
        INC XAML
        BNE MOD8CHK     ;Increment 'examine index".
        INC XAMH
MOD8CHK:
        LDA XAML        ;Check low-order 'exainine index' byte
        AND #$07        ;For MOD 8=0 ** changed to $0F to get 16 values per row
                        ;            ** rjh: changed back to 8 values per row
        BPL NXTPRNT     ;Always taken.
PRBYTE:
        PHA             ;Save A for LSD.
        LSR
        LSR
        LSR             ;MSD to LSD position.
        LSR
        JSR PRHEX       ;Output hex digit.
        PLA             ;Restore A.
PRHEX:
        AND #$0F        ;Mask LSD for hex print.
        ORA #$B0        ;Add "0".
        CMP #$BA        ;Digit?
        BCC ECHO        ;Yes, output it.
        ADC #$06        ;Add offset for letter.
ECHO:
        PHA             ;*Save A
        AND #$7F        ;*Change to "standard ASCII"
        JSR COUT        ; rjh - ECHO calls video method
        PLA             ;*Restore A
        RTS             ;*Done, over and out...

; Load an program in Intel Hex Format.
LOADINTEL:
        LDA #$0D
        JSR ECHO      ;New line.
        LDA #<MSG_HEX_START
        STA MSGL
        LDA #>MSG_HEX_START
        STA MSGH
        JSR SHWMSG      ;Show Start Transfer.
        LDA #$0D
        JSR ECHO      ;New line.
        LDY #$00
        STY CRCCHECK   ;If CRCCHECK=0, all is good.
INTELLINE:
        JSR KEY_GET      ;Get char - rjh: use io card routine
        STA IN,Y      ;Store it
        INY            ;Next
        CMP   #$1B      ;Escape ?
        BEQ   INTELDONE   ;Yes, abort.
        CMP #$0D      ;Did we find a new line ?
        BNE INTELLINE   ;Nope, continue to scan line.
        LDY #$FF      ;Find (:)
FINDCOL:
        INY
        LDA IN,Y
        CMP #$3A      ; Is it Colon ?
        BNE FINDCOL      ; Nope, try next.
        INY            ; Skip colon
        LDX   #$00      ; Zero in X
        STX   CRC         ; Zero Check sum
        JSR GETHEX      ; Get Number of bytes.
        STA COUNTER      ; Number of bytes in Counter.
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        STA CRC         ; Store it
        JSR GETHEX      ; Get Hi byte
        STA STH         ; Store it
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        STA CRC         ; Store it
        JSR GETHEX      ; Get Lo byte
        STA STL         ; Store it
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        STA CRC         ; Store it
        LDA #$2E      ; Load "."
        JSR ECHO      ; Print it to indicate activity.
NODOT:
        JSR GETHEX      ; Get Control byte.
        CMP   #$01      ; Is it a Termination record ?
        BEQ   INTELDONE   ; Yes, we are done.
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        STA CRC         ; Store it
INTELSTORE:
        JSR GETHEX      ; Get Data Byte
        STA (STL,X)      ; Store it
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        STA CRC         ; Store it
        INC STL         ; Next Address
        BNE TESTCOUNT   ; Test to see if Hi byte needs INC
        INC STH         ; If so, INC it.
TESTCOUNT:
        DEC   COUNTER      ; Count down.
        BNE INTELSTORE   ; Next byte
        JSR GETHEX      ; Get Checksum
        LDY #$00      ; Zero Y
        CLC            ; Clear carry
        ADC CRC         ; Add CRC
        BEQ INTELLINE   ; Checksum OK.
        LDA #$01      ; Flag CRC error.
        STA   CRCCHECK   ; Store it
        JMP INTELLINE   ; Process next line.

INTELDONE:
        LDA CRCCHECK   ; Test if everything is OK.
        BEQ OKMESS      ; Show OK message.
        LDA #$0D
        JSR ECHO      ;New line.
        LDA #<MSG_HEX_FAIL      ; Load Error Message
        STA MSGL
        LDA #>MSG_HEX_FAIL
        STA MSGH
        JSR SHWMSG      ;Show Error.
        LDA #$0D
        JSR ECHO      ;New line.
        RTS

OKMESS:
        LDA #$0D
        JSR ECHO      ;New line.
        LDA #<MSG_HEX_OK      ;Load OK Message.
        STA MSGL
        LDA #>MSG_HEX_OK
        STA MSGH
        JSR SHWMSG      ;Show Done.
        LDA #$0D
        JSR ECHO      ;New line.
        RTS

GETHEX:
        LDA IN,Y      ;Get first char.
        EOR #$30
        CMP #$0A
        BCC DONEFIRST
        ADC #$08
DONEFIRST:
        ASL
        ASL
        ASL
        ASL
        STA L
        INY
        LDA IN,Y      ;Get next char.
        EOR #$30
        CMP #$0A
        BCC DONESECOND
        ADC #$08
DONESECOND:
        AND #$0F
        ORA L
        INY
        RTS

SHWMSG:
        LDY #$0
@PRINT: LDA (MSGL),Y
        BEQ @DONE
        JSR COUT        ; rjh: use COUT instead of ECHO to avoid high-bit
                        ;      shenanigans, as none of the messages have that!
        INY 
        BNE @PRINT
@DONE:  RTS 


.SEGMENT "RODATA"
MSG_MON_WELCOME:
        .byte $0D
        .byte $C9, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $BB, $0D
        .byte $BA, " Comp", $82, "6502 ", $BA, $0D
        .byte $C8, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $CD, $BC, $0D, $0D, 0
MSG_HEX_START:  .byte "Start Intel Hex code Transfer.",0
MSG_HEX_OK:     .byte "Intel Hex Imported OK.",0
MSG_HEX_FAIL:   .byte "Intel Hex Imported with checksum error.",0
