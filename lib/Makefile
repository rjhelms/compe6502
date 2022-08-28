AR := ar65
CA := ca65
CC := cc65

SRC := src
OBJ := obj

TARGET = compe6502.lib

CA_FLAGS := -D DYN_DRV=0 -I $(SRC)

INCLUDES = $(wildcard $(SRC)/*.inc)
SOURCE_DIRS = $(sort $(dir $(wildcard $(SRC)/*/)))
SOURCES = $(wildcard $(SRC)/*.s) $(wildcard $(SRC)/*/*.s)
OBJECT_DIRS = $(patsubst $(SRC)/%, $(OBJ)/%, $(SOURCE_DIRS))
OBJECTS = $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	cp supervision.lib $(TARGET)
	@echo $(OBJECTS)
	$(AR) r $(TARGET) $(OBJECTS)

$(OBJ)/%.o: $(SRC)/%.s $(INCLUDES) $(OBJ)
	${CA} ${CA_FLAGS} -o $@ $<

$(OBJ): | $(OBJECT_DIRS)

$(OBJECT_DIRS):
	mkdir -p $@

clean:
	rm -rf $(OBJ)
	rm -rf $(TARGET)