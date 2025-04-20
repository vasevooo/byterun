# Variables
IMAGE_NAME = byterun-test
TAG = py35
CONTAINER_NAME = $(IMAGE_NAME)-container

# Default target
.PHONY: all
all: test

# Build the Docker image
.PHONY: build
build:
	@echo "Building Docker image $(IMAGE_NAME):$(TAG)..."
	docker build -t $(IMAGE_NAME):$(TAG) .
	@echo "Build complete."

# Run tests inside the Docker container
.PHONY: test
test: build
	@echo "Running tests in Docker container..."
	docker run --rm --name $(CONTAINER_NAME) $(IMAGE_NAME):$(TAG) python -m pytest tests/test_basic.py tests/test_functions.py
	@echo "Tests complete."

# Clean up: remove the Docker image
.PHONY: clean
clean:
	@echo "Removing Docker image $(IMAGE_NAME):$(TAG)..."
	-docker rmi $(IMAGE_NAME):$(TAG)
	@echo "Cleanup complete."

# Shell access into a running container (for debugging)
.PHONY: shell
shell: build
	@echo "Starting shell in Docker container..."
	docker run --rm -it --name $(CONTAINER_NAME)-shell $(IMAGE_NAME):$(TAG) /bin/bash 