CC = gcc
CFLAGS = -Wall -Wextra -I./src
BIN_DIR = bin
DIST_DIR = dist
TARGET = $(BIN_DIR)/sign
TEST_RUNNER = $(BIN_DIR)/test_runner
ARTIFACT = $(DIST_DIR)/artifact.tar.gz

.PHONY: all clean build test package

all: build

$(BIN_DIR):
    mkdir -p $(BIN_DIR)

$(DIST_DIR):
    mkdir -p $(DIST_DIR)

build: $(TARGET)

$(TARGET): $(BIN_DIR) src/sign.c src/main.c src/sign.h
    $(CC) $(CFLAGS) -o $(TARGET) src/main.c src/sign.c

test: build
    $(CC) $(CFLAGS) -o $(TEST_RUNNER) tests/testcase.c src/sign.c
    $(TEST_RUNNER)

package: build $(DIST_DIR)
    tar -czf $(ARTIFACT) -C $(BIN_DIR) sign
    ls -lh $(ARTIFACT)

clean:
    rm -rf $(BIN_DIR) $(DIST_DIR)
