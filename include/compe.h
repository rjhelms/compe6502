#ifndef _COMPE_H
#define _COMPE_H

/* Color defines (default palette) */

#define COLOR_BLACK         0
#define COLOR_BLUE          1
#define COLOR_GREEN         2
#define COLOR_CYAN          3
#define COLOR_RED           4
#define COLOR_VIOLET        5
#define COLOR_BROWN         6
#define COLOR_GRAY2         7
#define COLOR_GRAY1         8
#define COLOR_LIGHTBLUE     9
#define COLOR_LIGHTGREEN    10
#define COLOR_LIGHTCYAN     11
#define COLOR_LIGHTRED      12
#define COLOR_MAGENTA       13
#define COLOR_YELLOW        14
#define COLOR_WHITE         15

/* TGI color defines (default palette) */

// NOTE: these colors only apply to indexed color modes, and as such are not
// valid in 8pp mode

#define TGI_COLOR_BLACK         0
#define TGI_COLOR_WHITE         1
#define TGI_COLOR_BLUE          2   // from here on, only valid in 4bpp mode
#define TGI_COLOR_GREEN         3
#define TGI_COLOR_CYAN          4
#define TGI_COLOR_RED           5
#define TGI_COLOR_VIOLET        6
#define TGI_COLOR_BROWN         7
#define TGI_COLOR_GRAY2         8
#define TGI_COLOR_GRAY1         9
#define TGI_COLOR_LIGHTBLUE     10
#define TGI_COLOR_LIGHTGREEN    11
#define TGI_COLOR_LIGHTCYAN     12
#define TGI_COLOR_LIGHTRED      13
#define TGI_COLOR_MAGENTA       14
#define TGI_COLOR_YELLOW        15


// no support for dynamic drivers until there's disk support!
#define DYN_DRV 0

/* time defines */
#define CLOCKS_PER_SEC      64

unsigned char get_video_byte (void);
void B_BEEP(void);

#define _bordercolor(color)     COLOR_BLACK
#define _cpeekrevers()          0

#endif
