#ifndef _COMPE_H
#define _COMPE_H

/* Color defines */
#define COLOR_BLACK         0
#define COLOR_BLUE          1
#define COLOR_GREEN         2
#define COLOR_CYAN          3
#define COLOR_RED           4
#define COLOR_MAGENTA       5
#define COLOR_BROWN         6
#define COLOR_LIGHTGRAY     7
#define COLOR_DARKGRAY      8
#define COLOR_LIGHTBLUE     9
#define COLOR_LIGHTGREEN    10
#define COLOR_LIGHTCYAN     11
#define COLOR_LIGHTRED      12
#define COLOR_LIGHTMAGENTA  13
#define COLOR_YELLOW        14
#define COLOR_WHITE         15

#define TGI_COLOR_BLACK     0
#define TGI_COLOR_WHITE     1

// no support for dynamic drivers until there's disk support!
#define DYN_DRV 0

/* time defines */
#define CLOCKS_PER_SEC      64

unsigned char get_video_byte (void);
void B_BEEP(void);

#define _bordercolor(color)     COLOR_BLACK
#define _cpeekrevers()          0

#endif
