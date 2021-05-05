FROM alpine:3.13.5 as build

ENV VERSION="0.4.1"

RUN apk add --no-cache nodejs npm

RUN npm install -g dockerfile-language-server-nodejs@${VERSION}

CMD [ "docker-langserver", "--stdio" ]
