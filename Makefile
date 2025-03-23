BINARY_NAME=url_shortener
SRC_DIR=$(PWD)/cmd/url-shortener
ENV_VARS=CONFIG_PATH=./config/local.yaml

.PHONY: all build run clean test lint deps

all: run clean

build:
	go build -o $(BINARY_NAME) $(SRC_DIR)

run: build
	$(ENV_VARS) ./$(BINARY_NAME)

clean:
	rm -f $(BINARY_NAME)
	go clean

test:
	go test ./... -v

lint:
	golangci-lint run ./...

deps:
	go mod tidy
	go mod vendor