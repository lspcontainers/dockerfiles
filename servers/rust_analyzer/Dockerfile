FROM alpine:3.15.0

RUN apk add -U --no-cache \
  bash \
  curl \
  gcc \
  cargo \
  && rm -rf /var/cache/apk/*

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add rust-analyzer@testing

CMD [ "rust-analyzer" ]
