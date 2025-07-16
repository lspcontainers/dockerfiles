FROM alpine:3.22.1

RUN apk add --no-cache \
  g++ \
  gcc \
  git \
  make \
  ruby \
  ruby-dev \
  zlib-dev \
  && gem install \
    solargraph

CMD [ "/usr/local/bundle/bin/solargraph", "stdio" ]
