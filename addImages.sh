#!/bin/bash

IMAGES_FOLDER=$1

if [ -z $IMAGES_FOLDER]
then
        read -ep "Enter path to images: " IMAGES_FOLDER
fi

echo $IMAGES_FOLDER

unix_time=$(date +%s%N)

echo "(1/4) Creating a meshroom container"
sudo docker run -itd --name $unix_time --mount source=$unix_time,target=/vol meshroom_base:base
echo "(2/4) Copying images to container"
sudo docker cp  $IMAGES_FOLDER. $unix_time:/home/meshroom/images/
echo "(3/4) Resizing images"
sudo docker exec $unix_time /bin/bash home/meshroom/mylib/resizer.sh 30
echo "(4/4) Starting meshroom"
sudo docker exec $unix_time /bin/bash home/meshroom/mylib/startMeshroomContainer.sh -a recons
