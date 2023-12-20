FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    dockerfile-language-server-nodejs

CMD [ "docker-langserver", "--stdio" ]
