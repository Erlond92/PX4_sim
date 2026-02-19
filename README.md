Build
`docker build -t px4-sitl:1.17-beta .`

RUN
`docker run -it --rm --name px4-sitl --network host --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY px4-sitl:1.17-beta`