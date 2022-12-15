# server-tool-for-meshroom
A tool for running the meshroom photogrammetry application as a server application

## Goal
- The goal is to be able to have a web-frontend where you can upload pictures and then send them to the backend which then uses meshroom to create a 3D model. 

## Important
- This is still in its very early stages, please read the code before attempting to run it!!!

## Note
- Only tested on Linux (Ubuntu 22.04.1 LTS x86_64 - Server) 
- I have not made the Cuda version available yet

## Instructions
1. Install docker and python3 with flask
2. Download the Meshroom tar.gz (The one I've been working with is version: Meshroom-2021.1.0-linux-cuda10) 
3. Run the install.sh script (It will ask for path to the tar.gz)
4. Run the add.sh script (It will ask for path to the images)
   - This will create a running container

## TODO 
- Add cuda option
- Add a backend and frontend
