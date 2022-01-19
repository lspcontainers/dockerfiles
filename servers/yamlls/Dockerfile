FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    yaml-language-server

CMD [ "yaml-language-server", "--stdio" ]
