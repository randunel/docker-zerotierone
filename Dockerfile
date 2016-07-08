FROM ubuntu:16.04

RUN apt-get update && \
        apt-get install -y build-essential debhelper libhttp-parser-dev liblz4-dev libnatpmp-dev dh-systemd ruby-ronn g++ make devscripts clang-3.8

RUN ln -sf /usr/bin/clang++-3.8 /usr/bin/clang++
RUN ln -sf /usr/bin/clang-3.8 /usr/bin/clang

COPY 1.1.6.tar.gz /zerotier/1.1.6.tar.gz
WORKDIR /zerotier
RUN mkdir src
RUN tar xf /zerotier/1.1.6.tar.gz -C src --strip-components 1
WORKDIR /zerotier/src
RUN make && make install
WORKDIR /zerotier

