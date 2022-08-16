#ifndef _COMPE_H
#define _COMPE_H

/* Color defines */
#define COLOR_BLACK         0x00
#define COLOR_BLUE          0x01
#define COLOR_GREEN         0x02
#define COLOR_CYAN          0x03
#define COLOR_RED           0x04
#define COLOR_MAGENTA       0x05
#define COLOR_BROWN         0x06
#define COLOR_LIGHTGRAY     0x07
#define COLOR_DARKGRAY      0x08
#define COLOR_LIGHTBLUE     0x09
#define COLOR_LIGHTGREEN    0x10
#define COLOR_LIGHTCYAN     0x11
#define COLOR_LIGHTRED      0x12
#define COLOR_LIGHTMAGENTA  0x13
#define COLOR_YELLOW        0x14
#define COLOR_WHITE         0x15

unsigned char get_video_byte (void);


#define _bordercolor(color)     COLOR_BLACK
#define _cpeekrevers()          0

#endif
