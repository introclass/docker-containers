SOURCE_DIR=$(shell pwd)/Server
PROJECT=$(shell basename ${SOURCE_DIR})
PREFIX=lijiaocn
TAG=1.0
IMAGE=${PREFIX}/websocket:${TAG}

build:
	docker run --rm -v ${SOURCE_DIR}:/go/src/${PROJECT} -w /go/src/${PROJECT} golang:1.11.2 \
	/bin/sh -c "CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -gcflags \"-N -l\""

image:
	docker build -t ${IMAGE}  .

run:
	docker run -idt \
		-p 80:8080  \
		${IMAGE}
