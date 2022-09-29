# .PHONY: help prepare-dev test lint run
# .DEFAULT_GOAL := help


# help:
# 	@reactjs -c "$$PRINT_HELP_REACTJS" < $(MAKEFILE_LIST)

export PATH := node_modules/.bin:$(PATH)
export SHELL := /bin/bash # Required for OS X for some reason



 all: yarn docker

yarn:
	yarn

yarn build:
	yarn build
	
docker-build: ## build docker file
	@docker build $(DOCKER_BUILD_FLAGS) -t $(SOURCE_IMAGE) -f $(DOCKER_FILE) $(DOCKER_BUILD_PATH)

docker-tag: ## docker tag
	@docker tag $(SOURCE_IMAGE) $(TARGET_IMAGE_LATEST)
	