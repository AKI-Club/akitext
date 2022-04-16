# akitext makefile
AKITEXT_TARGET := akitext
AKITEXT_DEBUG_TARGET := akitext_d

AKITEXT_SRC_FILES := akitext.c

CFLAGS := -Wall -Wextra -s -O2
CFLAGS_DEBUG := -Wall -Wextra -g -Og -DDEBUG

default: release

all: release debug

release: $(AKITEXT_TARGET)

debug: $(AKITEXT_DEBUG_TARGET)

$(AKITEXT_TARGET): $(AKITEXT_SRC_FILES)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

$(AKITEXT_DEBUG_TARGET): $(AKITEXT_SRC_FILES)
	$(CC) $(CFLAGS_DEBUG) $^ $(LDFLAGS) -o $@

clean:
	rm -f $(AKITEXT_TARGET) $(AKITEXT_DEBUG_TARGET)

.PHONY: all clean default release debug
