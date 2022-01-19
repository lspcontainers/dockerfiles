FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    intelephense

CMD [ "intelephense", "--stdio" ]
