all: build

build:
	@docker build --tag=nogsantos/ansible .

release: build
	@docker build --tag=nogsantos/ansible:$(shell cat VERSION) .
