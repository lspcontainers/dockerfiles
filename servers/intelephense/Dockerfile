FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    intelephense@1.14.4

CMD [ "intelephense", "--stdio" ]
