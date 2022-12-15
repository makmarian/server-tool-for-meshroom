
for file in /home/meshroom/images/*.*; do convert -resize $1%  ${file%} ${file%}; done
