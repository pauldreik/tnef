#!/bin/sh



export CC=afl-gcc
export CXX=afl-g++
export CXXFLAGS="-fsanitize=address,undefined -g"
export CFLAGS="-fsanitize=address,undefined -g"


if [ ! -e configure ] ; then
   autoreconf
fi


./configure 

make


mkdir -p afl-in afl-out
echo afl-fuzz -i afl-in -o afl-out -- src/tnef -K @@

