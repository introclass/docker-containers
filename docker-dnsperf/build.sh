#!/bin/bash
pushd ./dnsperf
	make clean
	make
popd
