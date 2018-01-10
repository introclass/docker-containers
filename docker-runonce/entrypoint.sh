#!/bin/bash
if [ "${SECONDS}" == "0" ];then
	SECONDS=10
fi
echo "`date`: this task will exit after ${SECONDS} second"
echo "`date`: execute on `hostname`"
sleep ${SECONDS}
echo "`date`: exit"
