PROVIDER_NAME := terraform-provider-template
BUILD_DIR     := .local/builds
PLATFORMS     := linux/amd64 linux/arm64 darwin/amd64 darwin/arm64

.PHONY: build clean docs install lint test

build:
	@mkdir -p $(BUILD_DIR)
	@for platform in $(PLATFORMS); do \
		os=$${platform%/*}; \
		arch=$${platform#*/}; \
		echo "Building $(PROVIDER_NAME)-$${os}-$${arch}"; \
		CGO_ENABLED=0 GOOS=$${os} GOARCH=$${arch} \
			go build -o $(BUILD_DIR)/$(PROVIDER_NAME)-$${os}-$${arch} .; \
	done

clean:
	rm -rf .local/

docs: install
	go run github.com/hashicorp/terraform-plugin-docs/cmd/tfplugindocs generate \
		-rendered-provider-name "GitHub" >/dev/null

install:
	go install ./...

lint:
	yamllint .
	golangci-lint run
	go mod tidy
	git diff --exit-code go.mod go.sum
	govulncheck ./...

test:
	go test -race -count=1 ./...
