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

SOURCES = $(SRC)/main.s
ASSEMBLY = $(patsubst $(SRC)/%.c, $(TEMP)/%.s, $(SOURCES))
OBJECTS = $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

.PHONY: all clean
.SECONDARY: 

all: $(TARGET)

$(TARGET): $(OBJECTS) $(BIN)
	$(LD) -C $(CONFIG) -Ln $(BIN)/$(PROJECT).lbl -m $(BIN)/$(PROJECT).map -o $(TARGET) $(OBJECTS) $(LIB)

$(OBJ)/%.o: $(SRC)/%.s $(OBJ)
	${CA} -v -o $@ $<

$(OBJ):
	mkdir $(OBJ)

$(BIN):
	mkdir $(BIN)
clean:
	rm -rf $(OBJ)
	rm -rf $(BIN)
