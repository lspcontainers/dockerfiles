FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  dockerfile-language-server-nodejs

CMD [ "/usr/bin/docker-langserver", "--stdio" ]
