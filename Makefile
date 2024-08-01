.POSIX:
.PHONY: default lint build dev test

default: build

node_modules: yarn.lock package.json packages/app/package.json packages/backend/package.json
	yarn install

lint: node_modules
	yarn tsc

build: lint node_modules
	yarn build:backend
	yarn build-image

dev: node_modules
	yarn dev

test:
	yarn test:all
