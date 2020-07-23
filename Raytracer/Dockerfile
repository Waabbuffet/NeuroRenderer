FROM ubuntu:18.04
LABEL maintainer=peng.sun@amd.com

# Register the ROCM package repository, and install rocm-dev package
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl libnuma-dev gnupg \
  && curl -sL http://repo.radeon.com/rocm/apt/debian/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main" | tee /etc/apt/sources.list.d/rocm.list \
  && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  sudo \
  libelf1 \
  rocm-dev \
  cmake \
  freeglut3 \
  freeglut3-dev \
  binutils-gold \
  libglew-dev \
  mesa-common-dev \
  build-essential && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update -y
RUN apt-get install libglu1-mesa-dev -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install x11vnc xvfb fluxbox -y

RUN apt-get install libxrandr-dev -y
RUN apt-get install libxcursor-dev -y
RUN apt-get install libxinerama-dev -y

WORKDIR /app
COPY . .

RUN sudo Xvfb :1 -screen 0 1920x1080x16 & /usr/bin/x11vnc -display :1.0 & DISPLAY=:1.0 
