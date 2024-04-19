# Extract configuration
CONFIG_FILE := build.config

CONFIG_HELLO := $(shell grep CONFIG_HELLO $(CONFIG_FILE) | cut -d '=' -f 2)
CONFIG_BYE := $(shell grep CONFIG_BYE $(CONFIG_FILE) | cut -d '=' -f 2)

# Source files
SRC := main.c
OBJ := main.o

# Conditional compilation
ifeq ($(CONFIG_HELLO),y)
	SRC += hello.c
	OBJ += hello.o
	CFLAGS += -DCONFIG_HELLO
endif

ifeq ($(CONFIG_BYE),y)
	SRC += bye.c
	OBJ += bye.o
	CFLAGS += -DCONFIG_BYE
endif

# Compiler settings
CC := gcc
CFLAGS += -Wall
LDFLAGS :=

# Target binary
TARGET := app

# Default target
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c $(CONFIG_FILE)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: all clean
