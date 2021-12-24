AR := ar65
CA := ca65
CC := cc65

SRC := src
OBJ := obj

TARGET = compe6502.lib

INCLUDES = $(wildcard $(SRC)/*.inc)
SOURCES = $(wildcard $(SRC)/*.s)
OBJECTS = $(patsubst $(SRC)/%.s, $(OBJ)/%.o, $(SOURCES))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	cp supervision.lib $(TARGET)
	$(AR) r $(TARGET) $(OBJECTS)

$(OBJ)/%.o: $(SRC)/%.s $(INCLUDES) $(OBJ)
	${CA} -o $@ $<

$(OBJ):
	mkdir $(OBJ)

clean:
	rm -rf $(OBJ)
	rm -rf $(TARGET)