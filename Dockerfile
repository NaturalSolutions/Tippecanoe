FROM alpine
LABEL maintainer="Javier Blanco <javier_blanco@natural-solutions.eu>"
ARG version="1.36.0"

# set up user
RUN addgroup -S tippecanoe && adduser -S -G tippecanoe tippecanoe
WORKDIR /home/tippecanoe

# install runtime dependencies
RUN apk add --no-cache libgcc libstdc++ sqlite-libs bash

# build tippecanoe
RUN apk add --no-cache git g++ make sqlite-dev zlib-dev \
  && cd /root \
  && git clone --depth=1 --branch=${version} https://github.com/mapbox/tippecanoe.git tippecanoe \
  && cd tippecanoe \
  && make \
  && make install \
  && rm -rf /root/tippecanoe \
  && apk del git g++ make sqlite-dev zlib-dev

# configure entrypoint
USER tippecanoe
ENTRYPOINT /bin/bash
