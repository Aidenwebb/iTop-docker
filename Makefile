.POSIX:

DOCKER_TAG = itop-docker
DOCKER_REVISION ?= latest

build:
	docker build -t ${DOCKER_TAG}:${DOCKER_REVISION} ./itop

