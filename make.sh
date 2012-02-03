#!/bin/sh
FORMAT=gnuwin32 #cygwin

if [ $1 == "clean" ]
then
    echo "cleaning"
    rm -f include/*.o
    rm -f *.o
    rm -f *.exe
    exit
fi

echo Compiling $1 as $FORMAT.
if [ ! -f include/asm_io.o ]
then
    nasm -f $FORMAT include/asm_io.asm
fi
if [ ! -f include/driver.o ]
then
    gcc -c include/driver.c -o include/driver.o
fi
nasm -f $FORMAT $1.asm
gcc -o $1 $1.o include/asm_io.o include/driver.o
