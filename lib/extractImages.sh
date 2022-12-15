#!/bin/bash

AnmountOfPictures=$1
SizePercent=$2
VideoPath=$3

WidthHeight=$(ffprobe $VideoPath -show_entries stream=width,height -v error -of default=noprint_wrappers=1)
WidthRaw=$(echo $WidthHeight | cut -d " " -f1)
HeightRaw=$(echo $WidthHeight | cut -d " " -f2)

Height=$(echo $HeightRaw | cut -d "=" -f2)
Width=$(echo $WidthRaw | cut -d "=" -f2)

FrameRate=$(ffprobe $VideoPath -show_entries stream=r_frame_rate -v error -of default=noprint_wrappers=1)
FramesRaw1=$(echo $FrameRate | cut -d " " -f1)
FramesRaw2=$(echo $FramesRaw1 | cut -d "=" -f2)
Frames=$(echo $FramesRaw2 | cut -d "/" -f1)

DurationRaw1=$(ffprobe $VideoPath -show_entries stream=duration -v error -of default=noprint_wrappers=1 | grep duration -m 1)
DurationRaw2=$(echo $DurationRaw1 | cut -d "=" -f2)
Duration=${DurationRaw2%.*}

TotalFrames=$(echo $(( $Frames * $Duration )))

DivideFactor=$(echo $(( $TotalFrames / $1  )))

ffmpeg -i $VideoPath -r $Frames/$DivideFactor -f image2 tmp/foo-%03d.png