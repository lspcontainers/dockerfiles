FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    bash-language-server

CMD [ "bash-language-server", "start" ]
