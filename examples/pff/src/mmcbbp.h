#ifndef _MMCBBP_DEFINED
#define _MMCBBP_DEFINED

/* assembly functions */
void __fastcall__ dly_us(unsigned char n);
void init_port();
void release_spi();
void rcvr_mmc();
void skip_mmc();
void xmit_mmc();

#endif	/* _MMCBBP_DEFINED */