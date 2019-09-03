#
# Makefile
# lijiaocn, 2018-07-12 13:51
#

PREFIX=lijiaocn
TAG=v1.11.0
IMAGE=${PREFIX}/envoy:${TAG}

image:
	docker build -f ./Dockerfile -t ${IMAGE}  .

push:
	docker push ${IMAGE}
