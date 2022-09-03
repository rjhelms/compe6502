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

// #include <hardware.h>			/* Include hardware specific declareation file here */

#define SD_MISO 0b00000001
#define SD_MOSI 0b00000010
#define SD_SCK 0b00000100
#define SD_CS 0b00001000

#define IO_VIA_START 0x8000
#define IO_VIA_PORTB 0x8000
#define IO_VIA_PORTA 0x8001
#define IO_VIA_DDRB 0x8002
#define IO_VIA_DDRA IO_VIA_START + 0x03
#define IO_VIA_T1CL IO_VIA_START + 0x04
#define IO_VIA_T1CH IO_VIA_START + 0x05
#define IO_VIA_T1LL IO_VIA_START + 0x06
#define IO_VIA_T1LH IO_VIA_START + 0x07
#define IO_VIA_T2CL IO_VIA_START + 0x08
#define IO_VIA_T2CH IO_VIA_START + 0x09
#define IO_VIA_SR IO_VIA_START + 0x0A
#define IO_VIA_ACR IO_VIA_START + 0x0B
#define IO_VIA_PCR IO_VIA_START + 0x0C
#define IO_VIA_IFR IO_VIA_START + 0x0D
#define IO_VIA_IER IO_VIA_START + 0x0E
#define IO_VIA_PORTA_NH IO_VIA_START + 0x0F

#define INIT_PORT() init_port() /* Initialize MMC control port (CS/CLK/DI:output, DO:input) */
#define DLY_US(n) dly_us(n)		/* Delay n microseconds */
#define FORWARD(d) (d)			/* Data in-time processing function (depends on the project) */

#define CS_H() *(char *)IO_VIA_PORTB |= SD_CS	 /* Set MMC CS "high" */
#define CS_L() *(char *)IO_VIA_PORTB &= ~SD_CS	 /* Set MMC CS "low" */
#define CK_H() *(char *)IO_VIA_PORTB |= SD_SCK	 /* Set MMC SCLK "high" */
#define CK_L() *(char *)IO_VIA_PORTB &= ~SD_SCK	 /* Set MMC SCLK "low" */
#define DI_H() *(char *)IO_VIA_PORTB |= SD_MOSI	 /* Set MMC DI "high" */
#define DI_L() *(char *)IO_VIA_PORTB &= ~SD_MOSI /* Set MMC DI "low" */
#define DO *(char *)IO_VIA_PORTB &SD_MISO		 /* Test MMC DO (high:true, low:false) */

void init_port()
{
	*(char *)IO_VIA_PORTB |= SD_MOSI | SD_SCK | SD_CS;
	*(char *)IO_VIA_DDRB |= SD_MOSI | SD_SCK | SD_CS;
	*(char *)IO_VIA_DDRB &= ~SD_MISO;
}

void dly_us(unsigned int n)
{
	clock_t end_time = clock() + (n / 0x4000);
	while (clock() <= end_time)
	{
	}
}

/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

/* Definitions for MMC/SDC command */
#define CMD0 (0x40 + 0)	   /* GO_IDLE_STATE */
#define CMD1 (0x40 + 1)	   /* SEND_OP_COND (MMC) */
#define ACMD41 (0xC0 + 41) /* SEND_OP_COND (SDC) */
#define CMD8 (0x40 + 8)	   /* SEND_IF_COND */
#define CMD16 (0x40 + 16)  /* SET_BLOCKLEN */
#define CMD17 (0x40 + 17)  /* READ_SINGLE_BLOCK */
#define CMD24 (0x40 + 24)  /* WRITE_BLOCK */
#define CMD55 (0x40 + 55)  /* APP_CMD */
#define CMD58 (0x40 + 58)  /* READ_OCR */

/* Card type flags (CardType) */
#define CT_MMC 0x01				 /* MMC ver 3 */
#define CT_SD1 0x02				 /* SD ver 1 */
#define CT_SD2 0x04				 /* SD ver 2 */
#define CT_SDC (CT_SD1 | CT_SD2) /* SD */
#define CT_BLOCK 0x08			 /* Block addressing */

static BYTE CardType; /* b0:MMC, b1:SDv1, b2:SDv2, b3:Block addressing */
BYTE data_byte;		  // byte to send
BYTE cmd;			  // command byte
BYTE tmp_cmd;		  // temp location to stash command for ACMD

DWORD arg;	   // argument for command
DWORD tmp_arg; // temporary location to stash arg for ACMD

BYTE *_buff;
DWORD sector;
UINT offset;
UINT count;

/*-----------------------------------------------------------------------*/
/* Transmit a byte to the MMC (bitbanging)                               */
/*-----------------------------------------------------------------------*/

static void xmit_mmc()
{
	if (data_byte & 0x80)
		DI_H();
	else
		DI_L(); /* bit7 */
	CK_H();
	CK_L();
	if (data_byte & 0x40)
		DI_H();
	else
		DI_L(); /* bit6 */
	CK_H();
	CK_L();
	if (data_byte & 0x20)
		DI_H();
	else
		DI_L(); /* bit5 */
	CK_H();
	CK_L();
	if (data_byte & 0x10)
		DI_H();
	else
		DI_L(); /* bit4 */
	CK_H();
	CK_L();
	if (data_byte & 0x08)
		DI_H();
	else
		DI_L(); /* bit3 */
	CK_H();
	CK_L();
	if (data_byte & 0x04)
		DI_H();
	else
		DI_L(); /* bit2 */
	CK_H();
	CK_L();
	if (data_byte & 0x02)
		DI_H();
	else
		DI_L(); /* bit1 */
	CK_H();
	CK_L();
	if (data_byte & 0x01)
		DI_H();
	else
		DI_L(); /* bit0 */
	CK_H();
	CK_L();
}

/*-----------------------------------------------------------------------*/
/* Receive a byte from the MMC (bitbanging)                              */
/*-----------------------------------------------------------------------*/

static void rcvr_mmc(void)
{
	DI_H(); /* Send 0xFF */

	data_byte = 0;
	if (DO)
		data_byte++; /* bit7 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit6 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit5 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit4 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit3 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit2 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit1 */
	CK_H();
	CK_L();
	data_byte <<= 1;
	if (DO)
		data_byte++; /* bit0 */
	CK_H();
	CK_L();

	return;
}

/*-----------------------------------------------------------------------*/
/* Skip bytes on the MMC (bitbanging)                                    */
/*-----------------------------------------------------------------------*/

static void skip_mmc(
	UINT n /* Number of bytes to skip */
)
{
	DI_H(); /* Send 0xFF */

	do
	{
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
		CK_H();
		CK_L();
	} while (--n);
}

/*-----------------------------------------------------------------------*/
/* Deselect the card and release SPI bus                                 */
/*-----------------------------------------------------------------------*/

static void release_spi(void)
{
	CS_H();
	rcvr_mmc();
}

/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static BYTE send_cmd()
{
	BYTE n;
	if (cmd & 0x80)
	{				   /* ACMD<n> is the command sequense of CMD55-CMD<n> */
		cmd &= 0x7F;   // low 7 bits only
		tmp_cmd = cmd; // stash command and arg
		tmp_arg = arg;

		// send cmd55
		cmd = CMD55;
		arg = 0;
		send_cmd();

		arg = tmp_arg; // recover cmd and arg
		cmd = tmp_cmd;
		if (data_byte > 1)
			return data_byte;
	}

	/* Select the card */
	CS_H();
	rcvr_mmc();
	CS_L();
	rcvr_mmc();

	/* Send a command packet */
	data_byte = cmd;
	xmit_mmc(); /* Start + Command index */
	data_byte = (BYTE)(arg >> 24);
	xmit_mmc(); /* Argument[31..24] */
	data_byte = (BYTE)(arg >> 16);
	xmit_mmc(); /* Argument[23..16] */
	data_byte = (BYTE)(arg >> 8);
	xmit_mmc(); /* Argument[15..8] */
	data_byte = (BYTE)arg;
	xmit_mmc();		  /* Argument[7..0] */
	data_byte = 0x01; /* Dummy CRC + Stop */
	if (cmd == CMD0)
		data_byte = 0x95; /* Valid CRC for CMD0(0) */
	if (cmd == CMD8)
		data_byte = 0x87; /* Valid CRC for CMD8(0x1AA) */
	xmit_mmc();

	/* Receive a command response */
	n = 10; /* Wait for a valid response in timeout of 10 attempts */
	do
	{
		rcvr_mmc();
	} while ((data_byte & 0x80) && --n);

	return data_byte; /* Return with the response value */
}

/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize(void)
{
	BYTE n, ty, buf[4];
	UINT tmr;
	INIT_PORT();
	CS_H();
	skip_mmc(10); /* Dummy clocks */

	ty = 0;

	cmd = CMD0;
	arg = 0;
	if (send_cmd() == 1)
	{ /* Enter Idle state */
		cmd = CMD8;
		arg = 0x1AA;
		if (send_cmd() == 1)
		{ /* SDv2 */
			for (n = 0; n < 4; n++)
			{
				rcvr_mmc(); /* Get trailing return value of R7 resp */
				buf[n] = data_byte;
			}
			if (buf[2] == 0x01 && buf[3] == 0xAA)
			{ /* The card can work at vdd range of 2.7-3.6V */
				arg = 1UL << 30;
				for (tmr = 1000; tmr; tmr--)
				{				  /* Wait for leaving idle state (ACMD41 with HCS bit) */
					cmd = ACMD41; // this needs to stay in the loop to avoid clobbering high bit
					if (send_cmd() == 0)
						break;
					DLY_US(1000);
				}
				cmd = CMD58;
				arg = 0;
				if (tmr && send_cmd() == 0)
				{ /* Check CCS bit in the OCR */
					for (n = 0; n < 4; n++)
					{
						rcvr_mmc();
						buf[n] = data_byte;
					}
					ty = (buf[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2; /* SDv2 (HC or SC) */
				}
			}
		}
		else
		{ /* SDv1 or MMCv3 */
			cmd = ACMD41;
			arg = 0;
			if (send_cmd() <= 1)
			{
				ty = CT_SD1;
				for (tmr = 1000; tmr; tmr--)
				{				  /* Wait for leaving idle state */
					cmd = ACMD41; /* SDv1 */
					if (send_cmd() == 0)
						break;
					DLY_US(1000);
				}
			}
			else
			{
				ty = CT_MMC;
				cmd = CMD1; /* MMCv3 */
				for (tmr = 1000; tmr; tmr--)
				{ /* Wait for leaving idle state */
					if (send_cmd() == 0)
						break;
					DLY_US(1000);
				}
			}
			cmd = CMD16;
			arg = 512;
			if (!tmr || send_cmd() != 0) /* Set R/W block length to 512 */
				ty = 0;
		}
	}
	CardType = ty;
	release_spi();

	return ty ? 0 : STA_NOINIT;
}

/*-----------------------------------------------------------------------*/
/* Read partial sector                                                   */
/*-----------------------------------------------------------------------*/

DRESULT disk_readp(void)
{
	DRESULT res;
	UINT bc, tmr;
	_buff = buff;
	if (!(CardType & CT_BLOCK))
	{
		arg = sector * 512; /* Convert to byte address if needed */
	} else {
		arg = sector;
	}

	res = RES_ERROR;
	cmd = CMD17;
	if (send_cmd() == 0)
	{ /* READ_SINGLE_BLOCK */

		tmr = 1000;
		do
		{ /* Wait for data packet in timeout of 100ms */
			DLY_US(100);
			rcvr_mmc();
		} while (data_byte == 0xFF && --tmr);

		if (data_byte == 0xFE)
		{ /* A data packet arrived */
			bc = 514 - offset - count;

			/* Skip leading bytes */
			if (offset)
				skip_mmc(offset);

			/* Receive a part of the sector */
			if (buff)
			{ /* Store data to the memory */
				do
				{
					rcvr_mmc();
					*_buff++ = data_byte;
				} while (--count);
			}

			/* Skip trailing bytes and CRC */
			skip_mmc(bc);

			res = RES_OK;
		}
	}

	release_spi();

	return res;
}

/*-----------------------------------------------------------------------*/
/* Write partial sector                                                  */
/*-----------------------------------------------------------------------*/
#if PF_USE_WRITE

DRESULT disk_writep(
	const BYTE *buff, /* Pointer to the bytes to be written (NULL:Initiate/Finalize sector write) */
	DWORD sc		  /* Number of bytes to send, Sector number (LBA) or zero */
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
				wc = 512;		/* Set byte counter */
				res = RES_OK;
			}
		}
		else
		{ /* Finalize sector write transaction */
			bc = wc + 2;
			while (bc--)
				xmit_mmc(0); /* Fill left bytes and CRC with zeros */
			if ((rcvr_mmc() & 0x1F) == 0x05)
			{														/* Receive data resp and wait for end of write process in timeout of 300ms */
				for (tmr = 10000; rcvr_mmc() != 0xFF && tmr; tmr--) /* Wait for ready (max 1000ms) */
					DLY_US(100);
				if (tmr)
					res = RES_OK;
			}
			release_spi();
		}
	}

	return res;
}
#endif
