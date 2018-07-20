#
# Makefile
# lijiaocn, 2018-07-12 13:51
#

PREFIX=lijiaocn
TAG=1.0
IMAGE=${PREFIX}/sshproxy:${TAG}

image:
	docker build -f ./Dockerfile -t ${IMAGE}  .

push:
	docker push ${IMAGE}
