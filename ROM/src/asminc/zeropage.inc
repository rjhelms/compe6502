.ifndef _ZEROPAGE_INC_
        _ZEROPAGE_INC_=1

; from video.s

.globalzp       SCREEN_PTR, SCROLL_PTR

; from ewoz.s

.globalzp       XAML, XAMH, STL, STH, L, H, YSAV, MODE, MSGL, MSGH, COUNTER
.globalzp       COUNTER, CRC, CRCCHECK

;from ewoz_ext.s

.globalzp       AREG, XREG, YREG, PREG, SREG, PCL, PCH

.endif
