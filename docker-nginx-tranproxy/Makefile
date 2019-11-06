#
# Makefile
# lijiaocn, 2018-07-12 13:51
#

PREFIX=lijiaocn
TAG=0.1
IMAGE=${PREFIX}/nginx-tranproxy:${TAG}

image:
	docker build -f ./Dockerfile -t ${IMAGE}  .

push:
	docker push ${IMAGE}
