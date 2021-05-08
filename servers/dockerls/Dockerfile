FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  dockerfile-language-server-nodejs@${VERSION}

CMD [ "/usr/bin/docker-langserver", "--stdio" ]
