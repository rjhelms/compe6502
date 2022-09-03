/*----------------------------------------------------------------------*/
/* Petit FatFs sample project for generic uC  (C)ChaN, 2010             */
/*----------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include "pff.h"

#define VIDEO_DATA 0xB801

void die(           /* Stop with dying message */
         FRESULT rc /* FatFs return value */
)
{
    char error[32];

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
    // DIR dir;	 /* Directory object */
    // FILINFO fno; /* File information object */
    UINT i;
    FRESULT rc;

    do
    {
        clrscr();
        cputs("\r\nMount a volume.\r\n");
        rc = pf_mount();
        if (rc)
            if (rc != 2)
            {
                die(rc);
            }
    } while (rc);

    cputs("Open an image file.\r\n");
    rc = pf_open("CASTLE.IMG");
    if (rc)
    {
        die(rc);
        return (EXIT_FAILURE);
    }

    *(unsigned char *)VIDEO_DATA = 0xFF; // reset video buffer
    for (;;)
    {
        rc = pf_read(); /* Read a chunk of file */
        if (rc || !br)
            break;               /* Error or end of file */
        for (i = 0; i < br; i++) /* Type the data */
            *(unsigned char *)VIDEO_DATA = buff[i];
    }
    if (rc)
    {
        die(rc);
        return (EXIT_FAILURE);
    }

#if PF_USE_WRITE
    cputs("Open a file to write (write.txt).\r\n");
    rc = pf_open("WRITE.TXT");
    if (rc)
        die(rc);

    cputs("Write a text data. (Hello world!)\r\n");
    for (;;)
    {
        rc = pf_write("Hello world!\r\n", 14, &bw);
        if (rc || !bw)
            break;
    }
    if (rc)
        die(rc);

    cputs("Terminate the file write process.\r\n");
    rc = pf_write(0, 0, &bw);
    if (rc)
        die(rc);
#endif

#if PF_USE_DIR
    cputs("Open root directory.\r\n");
    rc = pf_opendir(&dir, "");
    if (rc)
        die(rc);

    cputs("Directory listing...\r\n");
    for (;;)
    {
        rc = pf_readdir(&dir, &fno); /* Read a directory item */
        if (rc || !fno.fname[0])
            break; /* Error or end of dir */
        if (fno.fattrib & AM_DIR)
            cprintf("   <dir>  %s\r\n", fno.fname);
        else
            cprintf("%8lu  %s\r\n", fno.fsize, fno.fname);
    }
    if (rc)
        die(rc);
#endif
    cgetc();
    *(unsigned char *)VIDEO_DATA = 0xF0;
    return (EXIT_SUCCESS);
}
