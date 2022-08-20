#include <conio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#include <cc65.h>
#include <tgi.h>

#include <compe.h>

#define CLOCK_TICKS 0x030F
clock_t cur_time;
signed long offset;
unsigned int seconds;
unsigned int new_seconds;
unsigned int minutes;
unsigned int hours;

unsigned int sin_table[360];
unsigned int cos_table[360];

unsigned char idx;
char in_char;
char in_buf[32];

unsigned int __fastcall__ get_val(char *prompt);
void __fastcall__ set_time();

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

    cprintf("\r\n%02u:%02u:%02u\r\n", new_hours, new_minutes, new_seconds);

    new_time = ((unsigned long)new_hours * 216000) + ((unsigned long)new_minutes * 3600) + (new_seconds * 60);
    *(unsigned long *)CLOCK_TICKS = new_time;
    cprintf("%lu\r\n%lu\r\n", new_time, clock());
}

int main()
{
    clrscr();
    build_tables();
    set_time();
    while (true)
    {
        cur_time = clock();
        cur_time /= 60;
        new_seconds = cur_time % 60;
        if (new_seconds != seconds)
        {
            seconds = new_seconds;
            cur_time /= 60;
            minutes = cur_time % 60;
            cur_time /= 60;
            hours = cur_time % 12;
            clrscr();
            gotoxy(0, 0);
            cprintf("%02u:%02u:%02u\r\n", hours, minutes, seconds);
            gotoxy(20 + tgi_imulround(19, cos_table[seconds * 6]),
                   12 + tgi_imulround(11, sin_table[seconds * 6]));
            cputc('S');
            gotoxy(20 + tgi_imulround(17, cos_table[(minutes * 6) + (seconds / 10)]),
                   12 + tgi_imulround(10, sin_table[(minutes * 6) + seconds / 10]));
            cputc('M');
            gotoxy(20 + tgi_imulround(14, cos_table[(hours * 30) + (minutes / 10)]),
                   12 + tgi_imulround(8, sin_table[(hours * 30) + (minutes / 10)]));
            cputc('H');
            // cprintf("%04X, %04X", sin_table[seconds], cos_table[seconds]);
        }
    }
    return (0);
}
