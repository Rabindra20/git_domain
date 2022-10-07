
 .PHONY: help prepare-dev test lint run
 .DEFAULT_GOAL := help

export PATH := node_modules/.bin:$(PATH)
export SHELL := /bin/bash # Required for OS X for some reason
top:
	npm -l


# all: yarn yarn_build docker-build

yarn:
	yarn

yarn_build:
	yarn build
	
docker-build: ## build docker file
	@docker build $(DOCKER_BUILD_FLAGS) -t $(SOURCE_IMAGE) -f $(DOCKER_FILE) $(DOCKER_BUILD_PATH)

docker-tag: ## docker tag
	@docker tag $(SOURCE_IMAGE) $(TARGET_IMAGE_LATEST)

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1\3/p' \
	| column -t  -s ' '