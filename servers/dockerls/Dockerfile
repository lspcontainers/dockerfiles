FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    dockerfile-language-server-nodejs

CMD [ "docker-langserver", "--stdio" ]
