#!/bin/sh
#author: natsu1211

for folder in Lvim xvim
do
    cd $folder
    sh setup.sh
    cd ..
done

