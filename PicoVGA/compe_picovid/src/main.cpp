
// ****************************************************************************
//
//                                 Main code
//
// ****************************************************************************

#include "include.h"

#define PIN_DATA_FIRST 10
#define PIN_READ 18
#define PIN_WRITE 19
#define PIN_EF 20
#define PIN_FF 21
#define PIN_OE 22

#define VID_HEIGHT 192
#define VID_WIDTH_XS 160
#define VID_WIDTH_LO 320
#define VID_WIDTH_HI 640
#define VID_WFULL_XS 160
#define VID_WFULL_LO 320
#define VID_WFULL_HI 640

#define TEXT_BOTTOM_4_HEIGHT (8 * 4)
#define TEXT_OFFSET_BOTTOM_4 (80 * 20)

#define CURSOR_XOR_MASK 0b10000000
#define CURSOR_BLINK_MS 250

u8 bg;
u8 fg;

enum DispMode
{
	TEXT40 = 0,
	TEXT80 = 1,
	GR4BPP_TEXT = 2,
	GR1BPP_TEXT = 3,
	GR8BPP = 4,
	INVALID = 5,
	GR4BPP = 6,
	GR1BPP = 8
} dispMode;

enum CmdState
{
	DEFAULT,
	TEXT,
	CMD_C0_PUSH_GR_BYTE,
	CMD_D0_WRITE_CHAR,
	CMD_DC_MOVE_X_REL,
	CMD_DD_MOVE_Y_REL,
	CMD_DE_MOVE_X_ABS,
	CMD_DF_MOVE_Y_ABS,
	CMD_E0_SET_FG,
	CMD_E1_SET_BG
} state;

ALIGNED u8 textBuf[80 * 24];
ALIGNED u8 grBuf[320 * 192 / 2];

u8 *grPtr;

u8 pal16[16];

bool cursorEnabled = true;
bool cursorState = false;
absolute_time_t cursorNextBlink;

// converts an X / Y position into a pointer offset
int GetTextBufOffset(int X, int Y)
{
	int offset = X + (Y * PrintBufWB); // offset common to all modes

	if (dispMode == GR4BPP_TEXT || dispMode == GR1BPP_TEXT)
	{
		// if in a graphics mode, Y coords are 20 lines down
		offset += TEXT_OFFSET_BOTTOM_4;
	}

	if (PrintBufWB >= PrintBufW * 2)
	{
		// in color modes, need to double X offset
		offset += X;
	}

	return offset;
}

void FlipCursorIfActive()
{
	if (cursorEnabled && cursorState)
	{
		textBuf[GetTextBufOffset(PrintX, PrintY)] ^= CURSOR_XOR_MASK;
	}
}

void PrintChar0Wrap(char ch)
{
	PrintChar0(ch);
	if (PrintX >= PrintBufW)
	{
		PrintX -= PrintBufW;
		PrintY++;
	}
}

// print character, using control characters CR, LF, TAB
void PrintCharCompe(char ch)
{
	FlipCursorIfActive();

	// BS
	if (ch == 0x08) // backspace
	{
		// TODO: handle below 0
		PrintX -= 1;
	}

	// CR
	else if (ch == CHAR_CR)
	{
		PrintX = 0;
	}

	// LF
	else if (ch == CHAR_LF)
	{
		PrintX = 0;
		PrintY++;
	}

	// Tab
	else if (ch == CHAR_TAB)
	{
		PrintX = (PrintX + 7) & ~7;
	}

	// character
	else
		PrintChar0Wrap(ch);

	FlipCursorIfActive();
}

void text_scroll()
{
	FlipCursorIfActive();
	for (int i = 0; i < (80 * 23); i++)
	{
		// for the first 23 lines of textBuf, copy the next line
		textBuf[i] = textBuf[i + 80];
	}
	if (dispMode == TEXT40 || dispMode == GR4BPP_TEXT)
	{
		for (int i = (80 * 23); i < (80 * 24); i += 2)
		{
			textBuf[i] = 0x20;
			textBuf[i + 1] = PrintCol;
		}
	}
	else if (dispMode == TEXT80 || dispMode == GR1BPP_TEXT)
	{
		for (int i = (80 * 23); i < (80 * 24); i++)
		{
			textBuf[i] = 0x20;
		}
	}

	PrintAddPos(0, -1); // move cursor up one
	FlipCursorIfActive();
}

void check_text_scroll()
{
	if (dispMode <= TEXT80)
	{
		if (PrintY >= 24)
		{
			text_scroll();
		}
		return;
	}

	if (dispMode <= GR1BPP_TEXT && PrintY >= 4)
	{
		text_scroll();
	}
	return;
}

void reset_palette()
{
	memcpy(pal16, DefPal16, 16);
	GenPal16Trans(Pal16Trans, pal16);
}

void rotate_palette_forward_full()
{
	u8 c0 = pal16[0];
	for (int i = 0; i < 15; i++)
	{
		pal16[i] = pal16[i + 1];
	}
	pal16[15] = c0;
	GenPal16Trans(Pal16Trans, pal16);
}

void rotate_palette_backward_full()
{
	u8 c15 = pal16[15];
	for (int i = 15; i > 0; i--)
	{
		pal16[i] = pal16[i - 1];
	}
	pal16[0] = c15;
	GenPal16Trans(Pal16Trans, pal16);
}

void rotate_palette_forward_high()
{
	u8 c12 = pal16[12];
	for (int i = 12; i < 15; i++)
	{
		pal16[i] = pal16[i + 1];
	}
	pal16[15] = c12;
	GenPal16Trans(Pal16Trans, pal16);
}

void rotate_palette_backward_high()
{
	u8 c15 = pal16[15];
	for (int i = 15; i > 12; i--)
	{
		pal16[i] = pal16[i - 1];
	}
	pal16[12] = c15;
	GenPal16Trans(Pal16Trans, pal16);
}

void configure_vid(u16 width, u16 wfull)
{
	VgaCfgDef(&Cfg);
	Cfg.width = width;
	Cfg.height = VID_HEIGHT;
	Cfg.wfull = wfull;
	Cfg.video = &VideoNTSCp;
	VgaCfg(&Cfg, &Vmode);
	set_sys_clock_pll(Vmode.vco * 1000, Vmode.pd1, Vmode.pd2);
	VgaInitReq(NULL); // call with null to clear any existing rendering
	VgaInitReq(&Vmode);
}

void set_mode_text40()
{
	configure_vid(VID_WIDTH_LO, VID_WFULL_LO);
	ScreenClear(pScreen);
	sStrip *strip = ScreenAddStrip(pScreen, VID_HEIGHT);
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_LO);
	ScreenSegmAText(segm, textBuf, FontBold8x8, 8, pal16, 80);
	PrintSetup(textBuf, 40, 24, 80);
	PrintSetCol(PC_COLOR(bg, fg));
	dispMode = TEXT40;
}

void set_mode_text80()
{
	configure_vid(VID_WIDTH_HI, VID_WFULL_HI);
	ScreenClear(pScreen);
	sStrip *strip = ScreenAddStrip(pScreen, VID_HEIGHT);
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_HI);
	ScreenSegmMText(segm, textBuf, FontBold8x8, 8, COL_BLACK, COL_WHITE, 80);
	PrintSetup(textBuf, 80, 24, 80);
	dispMode = TEXT80;
}

void set_mode_gr4_text()
{
	configure_vid(VID_WIDTH_LO, VID_WFULL_LO);
	ScreenClear(pScreen);

	sStrip *strip = ScreenAddStrip(pScreen, (VID_HEIGHT - TEXT_BOTTOM_4_HEIGHT));
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_LO);
	ScreenSegmGraph4(segm, grBuf, Pal16Trans, VID_WIDTH_LO / 2);
	Canvas.img = grBuf;
	Canvas.w = VID_WIDTH_LO;
	Canvas.h = (VID_HEIGHT - TEXT_BOTTOM_4_HEIGHT);
	Canvas.wb = VID_WIDTH_LO / 2;
	Canvas.format = CANVAS_4;

	grPtr = grBuf;

	strip = ScreenAddStrip(pScreen, TEXT_BOTTOM_4_HEIGHT);
	segm = ScreenAddSegm(strip, VID_WIDTH_LO);
	ScreenSegmAText(segm, textBuf + TEXT_OFFSET_BOTTOM_4, FontBold8x8, 8, pal16, 80);
	PrintSetup(textBuf + TEXT_OFFSET_BOTTOM_4, 40, 4, 80);
	PrintSetCol(PC_COLOR(bg, fg));
	dispMode = GR4BPP_TEXT;
}

void set_mode_gr1_text()
{
	configure_vid(VID_WIDTH_HI, VID_WFULL_HI);
	ScreenClear(pScreen);

	sStrip *strip = ScreenAddStrip(pScreen, (VID_HEIGHT - TEXT_BOTTOM_4_HEIGHT));
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_HI);
	ScreenSegmGraph1(segm, grBuf, COL_BLACK, COL_WHITE, VID_WIDTH_HI / 8);
	Canvas.img = grBuf;
	Canvas.w = VID_WIDTH_HI;
	Canvas.h = (VID_HEIGHT - TEXT_BOTTOM_4_HEIGHT);
	Canvas.wb = VID_WIDTH_HI / 8;
	Canvas.format = CANVAS_1;

	grPtr = grBuf;

	strip = ScreenAddStrip(pScreen, TEXT_BOTTOM_4_HEIGHT);
	segm = ScreenAddSegm(strip, VID_WIDTH_HI);
	ScreenSegmMText(segm, textBuf + TEXT_OFFSET_BOTTOM_4, FontBold8x8, 8, COL_BLACK, COL_WHITE, 80);
	PrintSetup(textBuf + TEXT_OFFSET_BOTTOM_4, 80, 4, 80);
	dispMode = GR1BPP_TEXT;
}

void set_mode_gr8()
{
	configure_vid(VID_WIDTH_XS, VID_WFULL_XS);
	ScreenClear(pScreen);

	sStrip *strip = ScreenAddStrip(pScreen, (VID_HEIGHT));
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_XS);
	ScreenSegmGraph8(segm, grBuf, VID_WIDTH_XS);
	Canvas.img = grBuf;
	Canvas.w = VID_WIDTH_XS;
	Canvas.h = (VID_HEIGHT);
	Canvas.wb = VID_WIDTH_XS;
	Canvas.format = CANVAS_8;

	grPtr = grBuf;
	dispMode = GR8BPP;
}

void set_mode_gr4()
{
	configure_vid(VID_WIDTH_LO, VID_WFULL_LO);
	ScreenClear(pScreen);

	sStrip *strip = ScreenAddStrip(pScreen, (VID_HEIGHT));
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_LO);
	ScreenSegmGraph4(segm, grBuf, Pal16Trans, VID_WIDTH_LO / 2);
	Canvas.img = grBuf;
	Canvas.w = VID_WIDTH_LO;
	Canvas.h = (VID_HEIGHT);
	Canvas.wb = VID_WIDTH_LO / 2;
	Canvas.format = CANVAS_4;

	grPtr = grBuf;
	dispMode = GR4BPP;
}

void set_mode_gr1()
{
	configure_vid(VID_WIDTH_HI, VID_WFULL_HI);
	ScreenClear(pScreen);

	sStrip *strip = ScreenAddStrip(pScreen, (VID_HEIGHT));
	sSegm *segm = ScreenAddSegm(strip, VID_WIDTH_HI);
	ScreenSegmGraph1(segm, grBuf, COL_BLACK, COL_WHITE, VID_WIDTH_HI / 8);
	Canvas.img = grBuf;
	Canvas.w = VID_WIDTH_HI;
	Canvas.h = (VID_HEIGHT);
	Canvas.wb = VID_WIDTH_HI / 8;
	Canvas.format = CANVAS_1;

	grPtr = grBuf;
	dispMode = GR1BPP;
}

void init_gpio()
{
	for (int i = 0; i < 8; i++)
	{
		gpio_init(PIN_DATA_FIRST + i);
		gpio_set_dir(PIN_DATA_FIRST + i, false);
	}

	gpio_init(PIN_EF);
	gpio_set_dir(PIN_EF, false);

	gpio_init(PIN_FF);
	gpio_set_dir(PIN_FF, false);

	gpio_init(PIN_READ);
	gpio_init(PIN_WRITE);
	gpio_init(PIN_OE);

	gpio_put(PIN_READ, true);
	gpio_put(PIN_WRITE, true);
	gpio_put(PIN_OE, false);

	gpio_set_dir(PIN_READ, true);
	gpio_set_dir(PIN_WRITE, true);
	gpio_set_dir(PIN_OE, true);

	stdio_init_all();
}

void reset_display()
{
	set_mode_text40();
	bg = PC_BLACK;
	fg = PC_WHITE;
	PrintSetCol(PC_COLOR(bg, fg));
	PrintClear();
	PrintHome();
	dispMode = TEXT40;
	reset_palette();
	cursorEnabled = true;
	cursorState = false;
	cursorNextBlink = make_timeout_time_ms(CURSOR_BLINK_MS);
}

u8 read_byte()
{
	u8 val = 0;
	gpio_put(PIN_READ, false);
	gpio_put(PIN_OE, true);

	sleep_us(1);

	val = 0;
	for (int i = 7; i >= 0; i--)
	{
		val <<= 1;
		if (gpio_get(PIN_DATA_FIRST + i))
		{
			val++;
		}
	}
	gpio_put(PIN_READ, true);
	gpio_put(PIN_OE, false);

	return val;
}

u8 read_byte_blocking()
{
	// spin until there is a byte
	while (!gpio_get(PIN_EF))
	{
	}
	return read_byte();
}

void cmd_c8_blit_bytestream()
{
	u8 startx = read_byte_blocking();
	u8 starty = read_byte_blocking();
	u8 w = read_byte_blocking();
	u8 h = read_byte_blocking();

	grPtr = grBuf;
	grPtr += starty * Canvas.wb;
	grPtr += startx;

	for (u8 y = 0; y < h; y++)
	{
		for (u8 x = 0; x < w; x++)
		{
			*grPtr = read_byte_blocking();
			grPtr++;
		}
		grPtr += (Canvas.wb - w);
	}
}

void cmd_ee_load_palette()
{
	for (int i = 0; i < 16; i++)
	{
		pal16[i] = read_byte_blocking();
	}
	GenPal16Trans(Pal16Trans, pal16);
	return;
}

int main()
{
	u8 last_byte = 0;
	state = DEFAULT;

	multicore_reset_core1();
	multicore_launch_core1(VgaCore);

	init_gpio();

	reset_display();

	while (true)
	{
		if (cursorEnabled && absolute_time_diff_us(get_absolute_time(), cursorNextBlink) < 0)
		{
			cursorNextBlink = make_timeout_time_ms(CURSOR_BLINK_MS);
			cursorState = !cursorState;
			textBuf[GetTextBufOffset(PrintX, PrintY)] ^= CURSOR_XOR_MASK;
		}

		if (gpio_get(PIN_EF)) // EF goes high when FIFO has content
		{
			last_byte = read_byte();
			switch (state)
			{
			case TEXT:
				switch (last_byte)
				{
				case 0x03:
					state = DEFAULT;
					break;
				default:
					PrintCharCompe(last_byte);
					check_text_scroll();
					break;
				}
				break;

			case CMD_C0_PUSH_GR_BYTE:
				*grPtr = last_byte;
				grPtr++;
				state = DEFAULT;
				break;

			case CMD_D0_WRITE_CHAR:
				FlipCursorIfActive();
				PrintChar0(last_byte);
				FlipCursorIfActive();
				state = DEFAULT;
				break;

			case CMD_DC_MOVE_X_REL:
				FlipCursorIfActive();
				PrintAddPos((s8)last_byte, 0);
				FlipCursorIfActive();
				state = DEFAULT;
				break;

			case CMD_DD_MOVE_Y_REL:
				FlipCursorIfActive();
				PrintAddPos(0, (s8)last_byte);
				FlipCursorIfActive();
				state = DEFAULT;
				break;

			case CMD_DE_MOVE_X_ABS:
				FlipCursorIfActive();
				PrintSetPos((s8)last_byte, PrintY);
				FlipCursorIfActive();
				state = DEFAULT;
				break;

			case CMD_DF_MOVE_Y_ABS:
				FlipCursorIfActive();
				PrintSetPos(PrintX, (s8)last_byte);
				FlipCursorIfActive();
				state = DEFAULT;
				break;

			case CMD_E0_SET_FG:
				fg = last_byte;
				PrintSetCol(PC_COLOR(bg, fg));
				state = DEFAULT;
				break;

			case CMD_E1_SET_BG:
				bg = last_byte;
				PrintSetCol(PC_COLOR(bg, fg));
				state = DEFAULT;
				break;

			default:
				switch (last_byte)
				{
				case 0x02: // enter text mode
					state = TEXT;
					break;
				case 0xC0: // push graphics byte
					state = CMD_C0_PUSH_GR_BYTE;
					break;
				case 0xC8: // blit bytestream;
					cmd_c8_blit_bytestream();
					break;
				case 0xD0: // write single text char
					state = CMD_D0_WRITE_CHAR;
					break;
				case 0xDC: // move X relative
					state = CMD_DC_MOVE_X_REL;
					break;
				case 0xDD: // move Y relative
					state = CMD_DD_MOVE_Y_REL;
					break;
				case 0xDE: // move X absolute
					state = CMD_DE_MOVE_X_ABS;
					break;
				case 0xDF: // move Y absolute
					state = CMD_DF_MOVE_Y_ABS;
					break;
				case 0xE0: // set foreground color
					state = CMD_E0_SET_FG;
					break;
				case 0xE1: // set background color
					state = CMD_E1_SET_BG;
					break;
				case 0xE8: // rotate palette forward
					rotate_palette_forward_full();
					break;
				case 0xE9: // rotate palette backward
					rotate_palette_backward_full();
					break;
				case 0xEA: // rotate high 4 forward
					rotate_palette_forward_high();
					break;
				case 0xEB:
					rotate_palette_backward_high();
					break;
				case 0xEE:
					cmd_ee_load_palette();
					break;
				case 0xEF: // reset palette
					reset_palette();
					break;
				case 0xF0: // set 40 col text mode
					set_mode_text40();
					break;
				case 0xF1: // set 80 col text mode
					set_mode_text80();
					break;
				case 0xF2: // set 4bpp with text mode
					set_mode_gr4_text();
					break;
				case 0xF3: // set 1bpp with text mode
					set_mode_gr1_text();
					break;
				case 0xF4: // set 8bpp mode
					set_mode_gr8();
					break;
				case 0xF6: // set 4bpp mode
					set_mode_gr4();
					break;
				case 0xF7: // set 1bpp mode
					set_mode_gr1();
					break;
				case 0xF8:				  // disable cursor
					FlipCursorIfActive(); // turn off if currently displayed
					cursorEnabled = false;
					break;
				case 0xF9:				  // enable cursor
					FlipCursorIfActive(); // turn off if currently displayed just in case it's already active
					cursorNextBlink = make_timeout_time_ms(CURSOR_BLINK_MS);
					cursorState = false;
					cursorEnabled = true;
					break;
				case 0xFE: //
					if (dispMode <= GR1BPP_TEXT)
					{
						PrintClear();
						PrintHome();
						cursorNextBlink = make_timeout_time_ms(CURSOR_BLINK_MS);
						cursorState = false;
					}
					if (dispMode >= GR4BPP_TEXT)
					{
						DrawClear(&Canvas);
					}
					// TODO - reset for graphics modes
					break;
				case 0xFF:
					reset_display();
				default:
					break;
				}
			}
		}
	}
}
