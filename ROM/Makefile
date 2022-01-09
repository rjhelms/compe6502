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

.PHONY: all clean
.SECONDARY: 

all: $(TARGET)

$(TARGET): $(OBJECTS) $(BIN)
	$(LD) -C $(CONFIG) -Ln $(BIN)/$(PROJECT).lbl -m $(BIN)/$(PROJECT).map -o $(TARGET) $(OBJECTS) $(LIB)

$(OBJ)/%.o: $(SRC)/%.s
	mkdir -p $(dir $@)
	git rev-parse --short==2 HEAD | cat $(SRC)/rom_ver_stub.inc - > $(SRC)/rom_ver.inc
	${CA} -v -o $@ $<

$(BIN):
	mkdir $(BIN)
clean:
	rm -rf $(OBJ)
	rm -rf $(BIN)
