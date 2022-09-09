AR := ar65
CA := ca65
CC := cc65
LD := ld65

SRC := src
OBJ := obj
BIN := bin
TEMP := tmp

PROJECT = pff_test
TARGET = $(BIN)/$(PROJECT).bin
PRG = $(BIN)/$(PROJECT).prg
HEXFILE = $(BIN)/$(PROJECT).hex
WAVE = $(BIN)/$(PROJECT).wav

CC65_INC = ../../include
CC_FLAGS := -Osir -I $(CC65_INC) --add-source -Cl

START_ADDRESS = 0x5600

SOURCE_DIRS = $(sort $(dir $(wildcard $(SRC)/*/)))

ASM_SOURCES = $(wildcard $(SRC)/*.s) $(wildcard $(SRC)/*/*.s)
C_SOURCES = $(wildcard $(SRC)/*.c) $(wildcard $(SRC)/*/*.c)

C_ASSEMBLY = $(patsubst $(SRC)/%.c, $(TEMP)/%.s, $(C_SOURCES))

OBJECT_DIRS = $(patsubst $(SRC)/%, $(OBJ)/%, $(SOURCE_DIRS))

OBJECTS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(C_SOURCES))
OBJECTS += $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(ASM_SOURCES))

LIB = ../../lib/compe6502.lib
CONFIG = ../../lib/compe6502_RAM.cfg

.PHONY: all clean
.SECONDARY: 

all: $(WAVE)

$(PRG): $(TARGET)
	cat $(TARGET).hdr $(TARGET) > $(PRG)

$(WAVE): $(TARGET)
	python ../../util/bin2tape.py $(TARGET) $(START_ADDRESS)

$(TARGET): $(OBJECTS) $(BIN)
	@echo $(OBJECTS)
	$(LD) -C $(CONFIG) -Ln $(BIN)/$(PROJECT).lbl -m $(BIN)/$(PROJECT).map -o $(TARGET) $(OBJECTS) $(LIB) -S $(START_ADDRESS)

$(OBJ)/%.o: $(SRC)/%.s $(OBJ)
	${CA} ${CA_FLAGS} -o $@ $<

$(OBJ)/%.o: $(TEMP)/%.s $(OBJ)
	${CA} ${CA_FLAGS} -o $@ $<

$(TEMP)/%.s: $(SRC)/%.c $(TEMP)
	$(CC) $(CC_FLAGS) -o $@ $<

$(OBJ): | $(OBJECT_DIRS)

$(OBJECT_DIRS):
	mkdir -p $@

$(TEMP):
	mkdir $(TEMP)

$(BIN):
	mkdir $(BIN)

clean:
	rm -rf $(OBJ)/*
	rm -rf $(BIN)/*
	rm -rf $(TEMP)/*
