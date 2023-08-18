@ECHO OFF

:: test that i can run a batch file
:: ECHO Hello World

:: Start up an alpine:latest docker
docker create --name DevopsTest alpine:latest >NUL

:: give it python

:: give it swapi-python

:: Get all spaceships

:: Check the spaceships for missing pilots, remove those

:: Print only spaceship name, and pilot list

:: clean up docker
:: PAUSE
docker container rm DevopsTest >NUL

PAUSE
