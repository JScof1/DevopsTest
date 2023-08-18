@ECHO OFF

:: test that i can run a batch file
:: ECHO Hello World

:: Start up an alpine:latest docker
docker create -i --name DevopsTest alpine:latest >NUL
docker start DevopsTest

:: give it python
docker exec DevopsTest apk update
docker exec DevopsTest apk add python3 py3-pip

:: give it swapi-python
docker exec DevopsTest apk add gcc libc-dev python3-dev 
docker exec DevopsTest pip install swapi

:: Get all spaceships

:: Check the spaceships for missing pilots, remove those

:: Print only spaceship name, and pilot list

:: clean up docker
PAUSE
docker container stop DevopsTest
docker container rm DevopsTest >NUL

:: PAUSE
