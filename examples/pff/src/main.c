/*----------------------------------------------------------------------*/
/* Petit FatFs sample project for generic uC  (C)ChaN, 2010             */
/*----------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <pff.h>

#define VIDEO_DATA 0xB801
#define ld_word(ptr) (*(WORD*)(ptr))    // cast a pointer to a word

unsigned char *load_loc;
unsigned char *write_loc;
char error[32];

void die(           /* Stop with dying message */
         FRESULT rc /* FatFs return value */
)
{

    itoa(rc, error, 10);
    cputs("Failed with rc=");
    cputs(error);
    cputs("\r\n");
    for (;;)
        ;
}

/*-----------------------------------------------------------------------*/
/* Program Main                                                          */
/*-----------------------------------------------------------------------*/

int main(void)
{
    int (*func) ();
    // DIR dir;	 /* Directory object */
    // FILINFO fno; /* File information object */
    UINT i;
    FRESULT rc;

    clrscr();
    cputs("\r\nMount a volume.\r\n");
    for (i = 0; i < 8; i++)
    {
        rc = pf_mount();
        if (rc)
        {
            if (rc != 2)
            {
                die(rc);
            }
        }
        else
        {
            break;
        }
    }

    if (rc)
    {
        die(rc);
    }

    cputs("Load a binary.\r\n");
    
    memcpy(dj.fn, "CLOCK   PRG", 12);
    rc = pf_open();
    if (rc)
    {
        die(rc);
        return (EXIT_FAILURE);
    }

    rc = pf_read();
    if (rc)
    {
        die(rc);
        return (EXIT_FAILURE);
    }
    load_loc = (unsigned char*)ld_word(buff);
    write_loc = (unsigned char*)ld_word(buff);
    itoa((unsigned int)load_loc, error, 16);
    cputs(error);
    cputs("\r\n");
    for (i = 2; i < br; i++)    // load first page w/ header
    {
        *write_loc = buff[i];
        write_loc++;
    }

    for (;;)
    {
        rc = pf_read(); /* Read a chunk of file */
        if (rc || !br)
            break;               /* Error or end of file */
        for (i = 0; i < br; i++) /* load the binary data */
        {
            *write_loc = buff[i];
            write_loc++;
        }
    }
    if (rc)
    {
        die(rc);
        return (EXIT_FAILURE);
    }
    func = (int (*)())load_loc;
    func(); // call the load location
    return (EXIT_SUCCESS);
}
