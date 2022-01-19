FROM alpine:3.15.0

RUN apk add --no-cache \
  g++ \
  gcc \
  git \
  make \
  ruby \
  ruby-dev \
  zlib-dev

RUN gem install solargraph

CMD [ "/usr/local/bundle/bin/solargraph", "stdio" ]
