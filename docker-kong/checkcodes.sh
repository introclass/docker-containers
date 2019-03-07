#! /bin/sh
#
# checkcodes.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com>
#
# Distributed under terms of the GPL license.
#


#$1：repo
#$2: tag
#$3: directory

REPO=$1
TAG=$2
DIR=$3

if [ ! -e $DIR ];then
	#git clone --depth 1 --single-branch $REPO  $DIR
	git clone $REPO  $DIR
fi

pushd $DIR
	git checkout $TAG; 
popd
