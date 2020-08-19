FROM nvidia/vulkan:1.1.121-cuda-10.1-alpha

WORKDIR /app 

COPY . .

RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install cmake -y
RUN apt-get install freeglut3-dev  -y
RUN apt-get install libxrandr-dev -y
RUN apt-get install libxcursor-dev -y
RUN apt-get install libxinerama-dev libxi-dev freeglut3-dev -y
