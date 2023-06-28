
 .PHONY: help prepare-dev test lint run
 .DEFAULT_GOAL := help

export PATH := node_modules/.bin:$(PATH)
export SHELL := /bin/bash # Required for OS X for some reason
top:
	npm -l
APP_ROOT ?= $(shell 'pwd')
# K8S ?= $(APP_ROOT)/k8s
BRANCH := $(shell git for-each-ref --format='%(objectname) %(refname:short)' refs/heads | awk "/^$$(git rev-parse HEAD)/ {print \$$2}")
HASH := $(shell git rev-parse HEAD)
# all: yarn yarn_build docker-build

#include $(K8S)/Makefile  #if makefile is inside folder
yarn:
	yarn

yarn_build:
	yarn build
	
docker-build: ## build docker file
	@docker build $(DOCKER_BUILD_FLAGS) -t $(SOURCE_IMAGE) -f $(DOCKER_FILE) $(DOCKER_BUILD_PATH)

docker-tag: ## docker tag
	@docker tag $(SOURCE_IMAGE) $(TARGET_IMAGE_LATEST)

deploy-app:
	@kubectl apply -k $(APP_ROOT)/overlays/$(BRANCH)/kustomize.yaml

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1\3/p' \
	| column -t  -s ' ' || @echo "help"
	#@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
