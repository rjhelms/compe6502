/*------------------------------------------------------------------------/
/  Bitbanging MMCv3/SDv1/SDv2 (in SPI mode) control module for PFF
/-------------------------------------------------------------------------/
/
/  Copyright (C) 2014, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/--------------------------------------------------------------------------/
 Features:

 * Very Easy to Port
   It uses only 4-6 bit of GPIO port. No interrupt, no SPI port is used.

 * Platform Independent
   You need to modify only a few macros to control GPIO ports.

/-------------------------------------------------------------------------*/

#include "pffconf.h"
#include "diskio.h"
#include "mmcbbp.h"
#include <time.h>

/*-------------------------------------------------------------------------*/
/* Platform dependent macros and functions needed to be modified           */
/*-------------------------------------------------------------------------*/

// #include <hardware.h> /* Include hardware specific declareation file here */

#define SD_MISO 0b00000001
#define SD_MOSI 0b00000010
#define SD_SCK 0b00000100
#define SD_CS 0b00001000

#define IO_VIA_START 0x8000
#define IO_VIA_PORTB 0x8000
#define IO_VIA_DDRB 0x8002

#define INIT_PORT() init_port() /* Initialize MMC control port (CS/CLK/DI:output, DO:input) */

#define CS_H() *(char *)IO_VIA_PORTB |= SD_CS    /* Set MMC CS "high" */
#define CS_L() *(char *)IO_VIA_PORTB &= ~SD_CS   /* Set MMC CS "low" */
#define CK_H() *(char *)IO_VIA_PORTB |= SD_SCK   /* Set MMC SCLK "high" */
#define CK_L() *(char *)IO_VIA_PORTB &= ~SD_SCK  /* Set MMC SCLK "low" */
#define DI_H() *(char *)IO_VIA_PORTB |= SD_MOSI  /* Set MMC DI "high" */
#define DI_L() *(char *)IO_VIA_PORTB &= ~SD_MOSI /* Set MMC DI "low" */
#define DO *(char *)IO_VIA_PORTB &SD_MISO        /* Test MMC DO (high:true, low:false) */

/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

/* Definitions for MMC/SDC command */
#define CMD0 (0x40 + 0)    /* GO_IDLE_STATE */
#define CMD1 (0x40 + 1)    /* SEND_OP_COND (MMC) */
#define ACMD41 (0xC0 + 41) /* SEND_OP_COND (SDC) */
#define CMD8 (0x40 + 8)    /* SEND_IF_COND */
#define CMD16 (0x40 + 16)  /* SET_BLOCKLEN */
#define CMD17 (0x40 + 17)  /* READ_SINGLE_BLOCK */
#define CMD24 (0x40 + 24)  /* WRITE_BLOCK */
#define CMD55 (0x40 + 55)  /* APP_CMD */
#define CMD58 (0x40 + 58)  /* READ_OCR */

/* Card type flags (CardType) */
#define CT_MMC 0x01              /* MMC ver 3 */
#define CT_SD1 0x02              /* SD ver 1 */
#define CT_SD2 0x04              /* SD ver 2 */
#define CT_SDC (CT_SD1 | CT_SD2) /* SD */
#define CT_BLOCK 0x08            /* Block addressing */


/* BSS variables for multiple methods */
BYTE data_byte; // byte sent or received
UINT tmr;       // counter for skip_mmc & time-outs

BYTE *_buff;
DWORD sector;
UINT offset;
UINT count;

/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------*/
/* Read partial sector                                                   */
/*-----------------------------------------------------------------------*/

DRESULT disk_readp(void)
{
    _buff = buff;
    if (!(CardType & CT_BLOCK))
    {
        arg = sector * 512; /* Convert to byte address if needed */
    }
    else
    {
        arg = sector;
    }

    result = RES_ERROR;
    cmd = CMD17;
    if (send_cmd() == 0)
    { /* READ_SINGLE_BLOCK */

        tmr = 1000;
        do
        { /* Wait for data packet in timeout of 100ms */
            dly_us(100);
            rcvr_mmc();
        } while (data_byte == 0xFF && --tmr);

        if (data_byte == 0xFE)
        { /* A data packet arrived */
            /* Skip leading bytes */
            if (offset)
            {
                tmr = offset;
                skip_mmc();
            }

            tmr = 514 - offset - count;

            do
            {
                rcvr_mmc();
                *_buff++ = data_byte;
            } while (--count);

            /* Skip trailing bytes and CRC */
            skip_mmc();

            result = RES_OK;
        }
    }

    release_spi();

    return result;
}

/*-----------------------------------------------------------------------*/
/* Write partial sector                                                  */
/*-----------------------------------------------------------------------*/
#if PF_USE_WRITE

DRESULT disk_writep(
    const BYTE *buff, /* Pointer to the bytes to be written (NULL:Initiate/Finalize sector write) */
    DWORD sc          /* Number of bytes to send, Sector number (LBA) or zero */
)
{
    DRESULT res;
    UINT bc, tmr;
    static UINT wc;

    res = RES_ERROR;

    if (buff)
    { /* Send data bytes */
        bc = (UINT)sc;
        while (bc && wc)
        { /* Send data bytes to the card */
            xmit_mmc(*buff++);
            wc--;
            bc--;
        }
        res = RES_OK;
    }
    else
    {
        if (sc)
        { /* Initiate sector write transaction */
            if (!(CardType & CT_BLOCK))
                sc *= 512; /* Convert to byte address if needed */
            if (send_cmd(CMD24, sc) == 0)
            { /* WRITE_SINGLE_BLOCK */
                xmit_mmc(0xFF);
                xmit_mmc(0xFE); /* Data block header */
                wc = 512;       /* Set byte counter */
                res = RES_OK;
            }
        }
        else
        { /* Finalize sector write transaction */
            bc = wc + 2;
            while (bc--)
                xmit_mmc(0); /* Fill left bytes and CRC with zeros */
            if ((rcvr_mmc() & 0x1F) == 0x05)
            {                                                       /* Receive data resp and wait for end of write process in timeout of 300ms */
                for (tmr = 10000; rcvr_mmc() != 0xFF && tmr; tmr--) /* Wait for ready (max 1000ms) */
                    dly_us(100);
                if (tmr)
                    res = RES_OK;
            }
            release_spi();
        }
    }

    return res;
}
#endif
