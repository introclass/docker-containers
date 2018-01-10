#!/bin/bash

find /usr/include -name "*.[ch]" -o -name "*.cpp" > cscope.files  
find `pwd` -name "*.[ch]" -o -name "*.cpp" >> cscope.files  
cscope -bR -i cscope.files
