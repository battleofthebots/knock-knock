FROM ghcr.io/battleofthebots/botb-base-image:latest

# Update this with youe challenge name if you are pushing to a docker registry
ARG NAME=knock-knock
LABEL org.opencontainers.image.title=$NAME org.opencontainers.image.description=$NAME org.opencontainers.image.url=https://github.com/battleofthebots/$NAME org.opencontainers.image.source=https://github.com/battleofthebots/$NAME org.opencontainers.image.version=main

RUN apt-get update && apt-get install -y knockd

EXPOSE 1000 3000 7000 4444
WORKDIR /opt

COPY config.ini .
RUN setcap cap_net_raw=eip `which knockd`

USER user
CMD knockd -D -c config.ini
