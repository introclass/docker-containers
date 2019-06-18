SOURCE_DIR=$(shell pwd)/Server
PROJECT=$(shell basename ${SOURCE_DIR})
PREFIX=lijiaocn
TAG=8.5.42
IMAGE=${PREFIX}/tomcat:${TAG}

image:
	docker build -t ${IMAGE}  .

run:
	docker run -idt \
		-p 8080:80  \
		${IMAGE}
