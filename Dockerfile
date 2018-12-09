# FROM resin/raspberrypi3-debian:stretch
FROM mitchallen/pi-cross-compile
# FROM gcc:8.2

# Install build tools and remove apt-cache afterwards
#RUN ["apt-get", "-q", "update"]
#RUN ["apt-get", "install", "-yq", "--no-install-recommends", "build-essential"]

# Switch into our apps working directory
WORKDIR /build

# Copy all the app source into docker context
COPY . /build/src
COPY Makefile /build

# Build our binary
RUN ["/bin/bash", "-c", "make", "-f", "${BUILD_FOLDER}/Makefile"]


#FROM resin/raspberrypi3-debian:stretch

#COPY --from=build /usr/src/app/hello hello

#switch on systemd init system in container
# ENV INITSYSTEM on

# Run our binary on container startup
CMD ["/bin/bash", "-c", "file", "./bin/hello"]
