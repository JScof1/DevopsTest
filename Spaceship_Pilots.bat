:: Start up an alpine:latest docker
docker create -i --name DevopsTest alpine:latest
docker start DevopsTest

:: give it python
docker exec DevopsTest apk add python3

:: inject Spacehships_Pilots.py to the docker
docker cp Spaceship_Pilots.py DevopsTest:Spaceship_Pilots.py

:: run the python script
docker exec DevopsTest python Spaceship_Pilots.py

:: clean up docker
PAUSE
docker container stop DevopsTest
docker container rm DevopsTest

:: Image not removed due to alpine:latest being a common image that might be used elsewhere