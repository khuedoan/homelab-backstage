.POSIX:
.PHONY: default lint build push dev test

default: build

node_modules: yarn.lock package.json packages/app/package.json packages/backend/package.json
	yarn install

lint: node_modules
	yarn tsc

build: lint node_modules
	yarn build:backend
	yarn build-image

push:
	docker push docker.io/khuedoan/backstage

dev: node_modules
	docker compose up --detach
	yarn dev

test: node_modules
	yarn test:all
