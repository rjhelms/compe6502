AR := ar65
CA := ca65
CC := cc65
LD := ld65

BIN := bin
SRC := src
OBJ := obj
TEMP := tmp

PROJECT = hangman
TARGET = $(BIN)/$(PROJECT).bin
HEXFILE = $(BIN)/$(PROJECT).hex

LIB = ../../lib/compe6502.lib
CONFIG = ../../lib/compe6502_RAM.cfg
CC_FLAGS = -O
CA_FLAGS =

START_ADDRESS = 0x600

SOURCES = $(SRC)/hangman.c
ASSEMBLY = $(patsubst $(SRC)/%.c, $(TEMP)/%.s, $(SOURCES))
OBJECTS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SOURCES))

.PHONY: all clean
.SECONDARY: 

all: $(HEXFILE)

$(HEXFILE): $(TARGET)
	srec_cat $(TARGET) -Binary -offset $(START_ADDRESS) -o $(HEXFILE) -intel -address-length=2

$(TARGET): $(OBJECTS) $(LIB) $(BIN)
	$(LD) -C $(CONFIG) -Ln $(BIN)/$(PROJECT).lbl -m $(BIN)/$(PROJECT).map -o $(TARGET) $(OBJECTS) $(LIB)

$(OBJ)/%.o: $(TEMP)/%.s $(OBJ)
	$(CA) $(CA_FLAGS) -o $@ $<

$(TEMP)/%.s: $(SRC)/%.c $(TEMP)
	$(CC) $(CC_FLAGS) -o $@ $<

$(TEMP):
	mkdir $(TEMP)

$(OBJ):
	mkdir $(OBJ)

$(BIN):
	mkdir $(BIN)
clean:
	rm -rf $(BIN)
	rm -rf $(OBJ)
	rm -rf $(TEMP)
