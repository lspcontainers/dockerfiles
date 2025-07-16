FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    yaml-language-server

CMD [ "yaml-language-server", "--stdio" ]
