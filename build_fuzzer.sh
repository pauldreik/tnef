#!/bin/sh



export CC=afl-gcc
export CXX=afl-g++
export CXXFLAGS="-fsanitize=address,undefined -g"
export CFLAGS="-fsanitize=address,undefined -g"
export LDFLAGS="-fsanitize=address,undefined"

if [ ! -e configure ] ; then
   autoreconf
fi


./configure --enable-debug

make


mkdir -p afl-in afl-out
echo afl-fuzz -m9999999999 -i afl-in -o afl-out -- src/tnef -K

