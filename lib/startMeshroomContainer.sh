#!/bin/bash

while getopts "a:" opt
do
	case "$opt" in
		a ) parameterA="$OPTARG" ;;
	esac
done

if [ -z "$parameterA" ]
then 
	echo "use -a then either defualt or recons"
fi

if [ "$parameterA" = "default" ]
then
	PROJECT_PATH="/home/meshroom/settings/default_project.json"
elif [ "$parameterA" = "recons" ]
then
	PROJECT_PATH="/home/meshroom/settings/reconstruction_project.json"
fi

echo $PROJECT_PATH

/home/meshroom/./meshroom_batch -p $PROJECT_PATH --input /home/meshroom/images/
