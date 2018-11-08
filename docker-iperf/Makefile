PREFIX=lijiaocn
TAG=1.0
IMAGE=${PREFIX}/iperf-server:${TAG}

image:
	docker build -t ${IMAGE}  .

run:
	docker run -idt \
		-p 5001:5001  \
		${IMAGE}
