#ifndef _MMCBBP_DEFINED
#define _MMCBBP_DEFINED

/* assembly functions */
void __fastcall__ dly_us(unsigned char n);
void init_port();
void skip_mmc();
void xmit_mmc();

#endif	/* _MMCBBP_DEFINED */