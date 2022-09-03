#ifndef _MMCBBP_DEFINED
#define _MMCBBP_DEFINED

void init_port();

void __fastcall__ dly_us(unsigned char n);
void skip_mmc();

static void __fastcall__ xmit_mmc();

#endif	/* _MMCBBP_DEFINED */