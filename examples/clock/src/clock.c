#include <conio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#include <cc65.h>
#include <tgi.h>
#include <cc65.h>

#include <compe.h>

#define CLOCK_TICKS 0x030F
#define VIDEO_DATA  0xB801

#define OUTER_RADIUS_PERCENT  0x00BF // just under ~75% 
#define SECOND_RADIUS_PERCENT 0x00BA // ~73%
#define MINUTE_RADIUS_PERCENT 0x00BA // ~73%
#define HOUR_RADIUS_PERCENT   0x008B // ~54%

clock_t cur_time;
signed long offset;
unsigned int seconds;
unsigned int new_seconds;
unsigned int minutes;
unsigned int hours;


unsigned int sin_table[360];
unsigned int cos_table[360];

unsigned int outer_rx;
unsigned int outer_ry;
unsigned int seconds_rx;
unsigned int seconds_ry;
unsigned int minutes_rx;
unsigned int minutes_ry;
unsigned int hours_rx;
unsigned int hours_ry;

unsigned int center_x;
unsigned int center_y;

unsigned char idx;
char in_char;
char in_buf[32];

unsigned int __fastcall__ get_val(char *prompt);
void __fastcall__ set_time();
void __fastcall__ draw_hand(unsigned int angle, unsigned int radius_x, unsigned int radius_y);

void build_tables()
{
    int angle;
    int i;
    for (i = 0; i < 360; i++)
    {
        angle = i - 90; // shift angles by 90 degrees so 0 is at top
        if (angle < 0)
        {
            angle += 360;
        }
        sin_table[i] = _sin(angle);
        cos_table[i] = _cos(angle);
    }
}

void set_radii()
{
    seconds_rx = tgi_imulround((tgi_getxres() >> 1) - 1, SECOND_RADIUS_PERCENT);
    seconds_ry = tgi_imulround(seconds_rx, tgi_getaspectratio());
    minutes_rx = tgi_imulround((tgi_getxres() >> 1) - 1, MINUTE_RADIUS_PERCENT);
    minutes_ry = tgi_imulround(minutes_rx, tgi_getaspectratio());
    hours_rx = tgi_imulround((tgi_getxres() >> 1) - 1, HOUR_RADIUS_PERCENT);
    hours_ry = tgi_imulround(hours_rx, tgi_getaspectratio());
}

unsigned int get_val(char *prompt)
{
    idx = 0;
    in_char = 0;

    cputs(prompt);
    cursor(1);

    while (in_char != 0x0D) // wait for carriage return
    {
        in_char = cgetc();
        in_buf[idx] = in_char;
        cputc(in_char);
        ++idx;
    }
    in_buf[idx] = 0;
    cursor(0);
    return (atoi(in_buf));
}

void set_time()
{
    unsigned int new_hours;
    unsigned int new_minutes;
    unsigned int new_seconds;
    clock_t new_time;

    clrscr();

    new_hours = get_val("Hours?\r\n");

    clrscr();

    new_minutes = get_val("Minutes?\r\n");

    clrscr();

    new_seconds = get_val("Seconds?\r\n");

    new_time = (new_seconds * CLOCKS_PER_SEC);
    new_time += ((unsigned long)new_minutes * (60 * CLOCKS_PER_SEC));
    new_time += ((unsigned long)new_hours * (3600UL * CLOCKS_PER_SEC));

    *(unsigned long *)CLOCK_TICKS = new_time;
}

void draw_hand(unsigned int angle, unsigned int radius_x, unsigned int radius_y)
{
    tgi_line(center_x, center_y, 
             center_x + tgi_imulround(radius_x, cos_table[angle]),
             center_y + tgi_imulround(radius_y, sin_table[angle]));
}

int main()
{
    build_tables();
    
    set_time();
    tgi_install(tgi_static_stddrv);
    tgi_init();
    center_x = tgi_getxres() >> 1;
    center_y = tgi_getyres() >> 1;
    set_radii();

    while (true)
    {
        if (kbhit())
        {
            cgetc();
            tgi_uninstall();
            return EXIT_SUCCESS;
        }

        cur_time = clock();
        cur_time /= CLOCKS_PER_SEC;
        new_seconds = cur_time % 60;

        if (new_seconds != seconds)
        {
            seconds = new_seconds;
            cur_time /= 60;
            minutes = cur_time % 60;
            cur_time /= 60;
            hours = cur_time % 12;
            tgi_clear();
            tgi_setcolor(TGI_COLOR_WHITE);
            draw_hand((hours * 30) + (minutes / 2), hours_rx, hours_ry);
            draw_hand((minutes * 6) + (seconds / 10), minutes_rx, minutes_ry);
            tgi_setcolor(13);   // TODO - make TGI_COLOR, check for color depth
            draw_hand(seconds * 6, seconds_rx, seconds_ry);
            tgi_setcolor(TGI_COLOR_WHITE);
            tgi_ellipse(center_x, center_y, seconds_rx, seconds_ry);
        }
    }
}
