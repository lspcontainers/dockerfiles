FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    yaml-language-server

CMD [ "/usr/bin/yaml-language-server", "--stdio" ]
