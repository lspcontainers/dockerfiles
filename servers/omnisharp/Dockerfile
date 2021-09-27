FROM alpine:3.13.5 as mono

ENV PREFIX="/mono/build"

RUN apk add --no-cache \
  bash \
  cmake \
  curl \
  g++ \
  gcc \
  git \
  make \
  linux-headers \
  perl \
  python3

WORKDIR /mono

RUN curl -L -O https://download.mono-project.com/sources/mono/mono-6.12.0.122.tar.xz \
  && tar -xf mono-6.12.0.122.tar.xz

WORKDIR /mono/mono-6.12.0.122

RUN ./configure --prefix=$PREFIX \
  && make \
  && make install

WORKDIR /mono/build

RUN ls -alh


#FROM debian:bullseye-slim

#WORKDIR /tmp

#RUN apt-get update \
  #&& apt-get install curl -y \
  #&& rm -rf /var/lib/apt/lists

#ARG VERSION

#RUN curl -L -O "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${VERSION}/omnisharp-linux-x64.tar.gz" \ 
  #&& tar -xf omnisharp-linux-x64.tar.gz -C /usr \
  #&& rm omnisharp-linux-x64.tar.gz 

#CMD [ "/usr/run", "--languageserver" ]
