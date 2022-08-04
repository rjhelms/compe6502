CONFIG_2C                       := 1
CONFIG_PEEK_SAVE_LINNUM         := 1
CONFIG_SCRTCH_ORDER             := 1
CONFIG_NO_LINE_EDITING          := 1    ; support for "@", "_", BEL etc.
CONIFG_NO_READ_Y_IS_ZERO_HACK   := 1


; inputbuffer
INPUTBUFFER     := $0200
RAMSTART2       := $0600
STACK_TOP       := $FE
SPACE_FOR_GOSUB := $36

.import COUT, KEY_READ, KEY_GET, MON_WARMRESET, VRAM_CLEAR_FULL, CLOAD, CSAVE

.include "../asminc/zeropage.inc"

MONCOUT         = COUT
USR             = GORESTART ; I don't know what this means
SYS             = MON_WARMRESET
HOME            = VRAM_CLEAR_FULL

WIDTH           = 40
WIDTH2          = 24

