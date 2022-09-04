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

/* BSS variables for send_cmd */
extern BYTE cmd;      // command byte
extern BYTE tmp_cmd;  // temp location to stash command for ACMD
extern DWORD arg;     // argument for command
extern DWORD tmp_arg; // temporary location to stash arg for ACMD

#endif	/* _MMCBBP_DEFINED */
