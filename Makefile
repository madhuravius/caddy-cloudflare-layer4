.PHONY: build run test help

IMAGE_NAME ?= caddy-cloudflare-layer4
CADDY_VERSION ?= 2

help:
	@echo "Available targets:"
	@echo "  make build       - Build the Docker image"
	@echo "  make run         - Run the Docker container and show version"
	@echo "  make test        - Test that Caddy starts successfully"
	@echo "  make help        - Show this help message"
	@echo ""
	@echo "Environment variables:"
	@echo "  IMAGE_NAME       - Docker image name (default: $(IMAGE_NAME))"
	@echo "  CADDY_VERSION    - Caddy version to build (default: $(CADDY_VERSION))"

build:
	docker build --build-arg CADDY_VERSION=$(CADDY_VERSION) -t $(IMAGE_NAME):$(CADDY_VERSION) .

run:
	docker run -it --rm $(IMAGE_NAME):$(CADDY_VERSION) caddy version

test:
	@echo "Testing Caddy startup..."
	docker run --rm -d --name caddy-test $(IMAGE_NAME):$(CADDY_VERSION) caddy run --config /dev/null > /dev/null 2>&1 && \
	sleep 2 && \
	(docker exec caddy-test caddy version > /dev/null 2>&1 && echo "✓ Caddy is running successfully" || echo "✗ Caddy failed to start") ; \
	docker stop caddy-test > /dev/null 2>&1 || true
