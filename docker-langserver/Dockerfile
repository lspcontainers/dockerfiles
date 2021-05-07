FROM node:14.16.1-alpine

ENV VERSION="0.4.1"

RUN npm install -g dockerfile-language-server-nodejs@${VERSION}

CMD [ "docker-langserver", "--stdio" ]
