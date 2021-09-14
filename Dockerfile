# Smallest base image
FROM alpine:3.13

MAINTAINER John Felten<john.felten@gmail.com>

ADD VERSION .

# Install needed packages
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && apk add --no-cache openssl easy-rsa openvpn iptables bash

# Configure tun
RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 
