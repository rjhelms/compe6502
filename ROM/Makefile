AR := ar65
CA := ca65
CC := cc65
LD := ld65

SRC := src
OBJ := obj
BIN := bin
TEMP := tmp

PROJECT = compe6502_ROM
TARGET = $(BIN)/$(PROJECT).bin

CONFIG = compe6502_ROM.cfg
CA_FLAGS =

SOURCES = $(wildcard $(SRC)/*.s) $(wildcard $(SRC)/*/*.s)
ASSEMBLY = $(patsubst $(SRC)/%.c, $(TEMP)/%.s, $(SOURCES))
OBJECTS = $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

INCLUDES = $(wildcard $(SRC)/asminc/*.inc)
ROM_VER = $(TEMP)/rom_ver.inc

.PHONY: all clean
.SECONDARY: 

all: $(TARGET) 

$(TARGET): $(OBJECTS) $(BIN)
	$(LD) -C $(CONFIG) -Ln $(BIN)/$(PROJECT).lbl -m $(BIN)/$(PROJECT).map -o $(TARGET) $(OBJECTS) $(LIB)


$(OBJ)/%.o: $(SRC)/%.s $(OBJ) $(INCLUDES) $(ROM_VER)
	${CA} -v -o $@ $<

$(BIN):
	mkdir $(BIN)

$(ROM_VER): $(TEMP)
	git rev-parse --short==2 HEAD | cat $(SRC)/asminc/rom_ver_stub.inc - > $(ROM_VER)

$(OBJ):
	mkdir $(OBJ)

$(TEMP):
	mkdir $(TEMP)

clean:
	rm -rf $(OBJ)
	rm -rf $(BIN)
	rm -rf $(TEMP)
