.POSIX:
.PHONY: default build dev

default: build

build:
	yarn build-image

dev:
	yarn dev
