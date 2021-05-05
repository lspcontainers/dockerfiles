FROM alpine:3.13.5 as build

RUN apk add --no-cache nodejs npm

RUN npm install -g dockerfile-language-server-nodejs

CMD [ "docker-langserver", "--stdio" ]
