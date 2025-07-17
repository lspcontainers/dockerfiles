FROM alpine:3.22.1

RUN apk add --no-cache \
  g++=14.2.0-r6 \
  gcc=14.2.0-r6 \
  git=2.49.1-r0 \
  make=4.4.1-r3 \
  ruby=3.4.4-r0 \
  ruby-dev=3.4.4-r0 \
  zlib-dev=1.3.1-r2 \
  && gem install \
    solargraph -v 0.55.1

CMD [ "/usr/local/bundle/bin/solargraph", "stdio" ]
