#!/bin/bash

MESHROOM_TAR=$1

if [ -z $MESHROOM_TAR]
then
	read -ep "Enter path to meshroom tar: " MESHROOM_TAR
fi

echo $MESHROOM_TAR

echo "(1/6) Checking tmp"
DIR="./tmp/"
if [ -d "$DIR" ];
then
        echo "- tmp existed and are now deleted"
        rm -r ./tmp
else
        echo "- tmp does not exists"
fi

echo "(2/6) Creating a new tmp folder"
mkdir tmp
mkdir tmp/meshroom

echo "(3/6) Copying meshroom tar to tmp"
echo $MESHROOM_TAR
cp $MESHROOM_TAR tmp/

echo "(4/6) Extracting meshroom tar"
tar -xf $MESHROOM_TAR --strip-component=1 -C tmp/meshroom

echo "(5/6) Building docker image"
#sudo docker build . -t meshroom_base:base --network host
sudo docker build . -t meshroom_base:base

#Removes tmp folder after copying it into the container
echo "(6/6) cleaning up tmp"
if [ -d "$DIR" ];
then
        echo "- tmp existed and are now deleted"
        rm -r ./tmp
else
        echo "- tmp does not exists"
fi

