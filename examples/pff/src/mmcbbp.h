#ifndef _MMCBBP_DEFINED
#define _MMCBBP_DEFINED

/* assembly functions */
void __fastcall__ dly_us(unsigned char n);
void init_port();
void release_spi();
void rcvr_mmc();
unsigned char send_cmd();
void skip_mmc();
void xmit_mmc();

extern BYTE CardType;   // b0: MMC, b1: SDv1, b2: SDv2, b3: block address
extern DRESULT result;  // result of disk operations

/* BSS variables for send_cmd */
extern BYTE cmd;      // command byte
extern BYTE tmp_cmd;  // temp location to stash command for ACMD
extern DWORD arg;     // argument for command
extern DWORD tmp_arg; // temporary location to stash arg for ACMD

/* BSS variables for multiple methods */
extern BYTE data_byte; // byte sent or received
extern UINT tmr;       // counter for skip_mmc & time-outs

extern BYTE *_buff;

#endif	/* _MMCBBP_DEFINED */
