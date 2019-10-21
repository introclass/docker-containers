SOURCE_DIR=$(shell pwd)/Server
PROJECT=$(shell basename ${SOURCE_DIR})
PREFIX=lijiaocn
TAG=0.0.1
IMAGE=${PREFIX}/http-record:${TAG}

build:
	docker run --rm -v ${SOURCE_DIR}:/go/src/${PROJECT} -w /go/src/${PROJECT} golang:1.8.1 \
	/bin/sh -c "CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -gcflags \"-N -l\""

image:
	docker build -t ${IMAGE}  .

run:
	docker run -idt \
		-p 1234:8080  \
		${IMAGE}
