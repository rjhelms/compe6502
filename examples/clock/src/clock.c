#include <cc65.h>
#include <conio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <tgi.h>
#include <time.h>

#include <compe.h>

#define CLOCK_TICKS 0x030F
#define VIDEO_DATA 0xB801

#define OUTER_RADIUS_PERCENT 0x00BD  // just under ~74%
#define SECOND_RADIUS_PERCENT 0x00BA // ~73%
#define MINUTE_RADIUS_PERCENT 0x00BA // ~73%
#define HOUR_RADIUS_PERCENT 0x007B   // ~48%

#define TICKS_PER_SIXTIETH 0x00F0 // 0.9375

clock_t cur_time;
signed long offset;

unsigned int sixtieths;
unsigned int seconds;
unsigned int minutes;
unsigned int hours;

unsigned int sin_table[360];
unsigned int cos_table[360];

unsigned int ellipse_x[25];
unsigned int ellipse_y[25];

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

unsigned char i;

char in_char;
char in_buf[32];

unsigned int __fastcall__ get_val(char *prompt);
void __fastcall__ set_time();
void __fastcall__ draw_hand(unsigned int angle, unsigned int radius_x, unsigned int radius_y);

void build_ellipse(int x, int y, unsigned char rx, unsigned char ry)
{
    int x1, y1, x2, y2;

    unsigned char inc = 15;
    unsigned char done = 0;
    unsigned sa = 0;
    unsigned ea = 360;

    i = 0;

    x1 = x + tgi_imulround(rx, _cos(sa));
    y1 = y - tgi_imulround(ry, _sin(sa));
    do
    {
        sa += inc;
        if (sa >= ea)
        {
            sa = ea;
            done = 1;
        }
        x2 = x + tgi_imulround(rx, _cos(sa));
        y2 = y - tgi_imulround(ry, _sin(sa));
        ellipse_x[i] = x1;
        ellipse_y[i] = y1;
        x1 = x2;
        y1 = y2;
        ++i;
    } while (!done);
    ellipse_x[i] = x1; // make sure to add the last point
    ellipse_y[i] = y1;
}

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
    outer_rx = tgi_imulround((tgi_getxres() >> 1) - 1, OUTER_RADIUS_PERCENT);
    outer_ry = tgi_imulround(outer_rx, tgi_getaspectratio());
    seconds_rx = tgi_imulround((tgi_getxres() >> 1) - 1, SECOND_RADIUS_PERCENT);
    seconds_ry = tgi_imulround(seconds_rx, tgi_getaspectratio());
    minutes_rx = tgi_imulround((tgi_getxres() >> 1) - 1, MINUTE_RADIUS_PERCENT);
    minutes_ry = tgi_imulround(minutes_rx, tgi_getaspectratio());
    hours_rx = tgi_imulround((tgi_getxres() >> 1) - 1, HOUR_RADIUS_PERCENT);
    hours_ry = tgi_imulround(hours_rx, tgi_getaspectratio());
}

unsigned int get_val(char *prompt)
{
    i = 0;
    in_char = 0;

    cputs(prompt);
    cursor(1);

    while (in_char != 0x0D) // wait for carriage return
    {
        in_char = cgetc();
        in_buf[i] = in_char;
        cputc(in_char);
        ++i;
    }
    in_buf[i] = 0;
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
    tgi_clear();

    center_x = tgi_getxres() >> 1;
    center_y = tgi_getyres() >> 1;

    set_radii();
    build_ellipse(center_x, center_y, outer_rx, outer_ry);

    while (true)
    {
        if (kbhit())
        {
            cgetc();
            tgi_uninstall();
            return EXIT_SUCCESS;
        }

        cur_time = clock();
        sixtieths = tgi_imulround(cur_time % CLOCKS_PER_SEC, TICKS_PER_SIXTIETH);

        cur_time /= CLOCKS_PER_SEC;
        seconds = cur_time % 60;
        cur_time /= 60;
        minutes = cur_time % 60;
        cur_time /= 60;
        hours = cur_time % 12;
        tgi_clear();
        tgi_setcolor(TGI_COLOR_WHITE);
        draw_hand((hours * 30) + (minutes / 2), hours_rx, hours_ry);
        draw_hand((minutes * 6) + (seconds / 10), minutes_rx, minutes_ry);
        tgi_setcolor(13); // TODO - make TGI_COLOR, check for color depth
        draw_hand((seconds * 6) + (sixtieths / 10), seconds_rx, seconds_ry);
        tgi_setcolor(TGI_COLOR_WHITE);
        for (i = 0; i < 24; ++i)
        {
            tgi_line(ellipse_x[i], ellipse_y[i],
                     ellipse_x[i + 1], ellipse_y[i + 1]);
        }
    }
}
