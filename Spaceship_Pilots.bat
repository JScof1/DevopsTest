@ECHO OFF

:: test that i can run a batch file
:: ECHO Hello World

:: Start up an alpine:latest docker
docker create -i --name DevopsTest alpine:latest >NUL
docker start DevopsTest

:: give it python
:: docker exec DevopsTest apk update
:: docker exec DevopsTest sh -c "rm -f /etc/apk/repositories"
:: docker exec DevopsTest sh -c "echo https://dl-cdn.alpinelinux.org/alpine/v3.15/main/ >> /etc/apk/repositories"
:: docker exec DevopsTest sh -c "echo https://dl-cdn.alpinelinux.org/alpine/v3.15/community/ >> /etc/apk/repositories"
:: PAUSE
docker exec DevopsTest apk add python3
:: py3-pip

:: give it swapi-python
:: docker exec DevopsTest apk add gcc libc-dev python3-dev
:: docker exec DevopsTest pip install swapi

:: Get all spaceships
:: Check the spaceships for missing pilots, remove those
:: Print only spaceship name, and pilot list
:: all taken care of in Spaceships_Pilots.py

:: inject Spacehships_Pilots.py to the docker
docker cp Spaceship_Pilots.py DevopsTest:Spaceship_Pilots.py

@ECHO OFF

:: run the python script
docker exec DevopsTest python Spaceship_Pilots.py

:: clean up docker
PAUSE
docker container stop DevopsTest
docker container rm DevopsTest >NUL

:: PAUSE
