FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    yaml-language-server

CMD [ "yaml-language-server", "--stdio" ]
