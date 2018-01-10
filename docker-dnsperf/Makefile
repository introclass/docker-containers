BUILDIMAGE=dnsperf:build
BUILDCONTAINER=dnsperf-build
IMAGENAME=docker-dnsperf:latest

compile:
	docker build -t ${BUILDIMAGE} -f Dockerfile.build   ./
	docker run -idt --name ${BUILDCONTAINER} ${BUILDIMAGE} sleep 10000
	docker cp . ${BUILDCONTAINER}:/root/
	docker exec -it ${BUILDCONTAINER} ./build.sh
	docker cp ${BUILDCONTAINER}:/root/dnsperf/dnsperf  ./bin/
	docker rm -f ${BUILDCONTAINER}

image:
	docker build -t ${IMAGENAME} -f ./Dockerfile  ./
	echo ${IMAGENAME}
