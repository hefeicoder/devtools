FROM ubuntu:20.04

ENV HOME /root
ENV USER /root

ARG DEBIAN_FRONTEND=noninteractive

# install basic
RUN apt-get update && yes | apt-get install \
  build-essential \
  libssl-dev \
  curl \
  git \
  make \
  gcc \
  apt-transport-https \
  ca-certificates \
  gnupg \
  bash-completion \
  apt-utils \
  rsync \
  python \
  python3 \
  python3-distutils \
  unzip \
  vim \
  zsh \
  protobuf-compiler \
  wget \
  sudo

## install cmake 3.20
RUN cd /tmp && wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz && tar -zxvf cmake-3.20.0.tar.gz
RUN cd /tmp/cmake-3.20.0 && ./bootstrap && make -j4 && make install

## install Go 1.17.4
RUN curl -LO https://storage.googleapis.com/golang/go1.17.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.4.linux-amd64.tar.gz

## install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
