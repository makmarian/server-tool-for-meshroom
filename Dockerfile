FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends python3 imagemagick python3-flask

COPY /settings/ /home/meshroom/settings/
COPY /lib/ /home/meshroom/mylib
COPY /tmp/meshroom/ /home/meshroom/
