#!/bin/bash

IMAGES_FOLDER=$1
SizePercent=$2
VideoPath=$3

if [ -z $IMAGES_FOLDER]
then
        read -ep "Enter path to images: " IMAGES_FOLDER
fi

unix_time=$(date +%s%N)

echo "(1/8) Checking tmp"
DIR="./tmp/"
if [ -d "$DIR" ];
then
        echo "- tmp existed and are now deleted"
        rm -r ./tmp
else
        echo "- tmp does not exists"
fi

echo "(2/8) Creating a new tmp folder"
mkdir tmp

echo "(3/8) Creating a new tmp folder"
lib/./extractImages.sh 100 0 $IMAGES_FOLDER

echo "(4/8) Creating a meshroom container"
sudo docker run -itd --name $unix_time --mount source=$unix_time,target=/vol meshroom_base:base
echo "(5/8) Copying images to container"
sudo docker cp tmp/ $unix_time:/home/meshroom/images/

#Removes tmp folder after copying it into the container
echo "(6/8) cleaning up tmp"
if [ -d "$DIR" ];
then
        echo "- tmp existed and are now deleted"
        rm -r ./tmp
else
        echo "- tmp does not exists"
fi

echo "(7/8) Resizing images"
sudo docker exec $unix_time /bin/bash home/meshroom/mylib/resizer.sh 30
echo "(8/8) Starting meshroom"
sudo docker exec $unix_time /bin/bash home/meshroom/mylib/startMeshroomContainer.sh -a recons