FROM alpine:3.13.5

RUN apk add --no-cache \
  g++ \
  gcc \
  git \
  make \
  ruby \
  ruby-dev \
  zlib-dev

ARG VERSION

RUN gem install solargraph -v $VERSION

CMD [ "/usr/local/bundle/bin/solargraph", "stdio" ]
