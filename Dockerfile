# FROM resin/raspberrypi3-debian:stretch
FROM mitchallen/pi-cross-compile

# Switch into our apps working directory
WORKDIR /build
COPY . /build

RUN ["/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc",\
  "-o", "hello", "hello.cpp"]

