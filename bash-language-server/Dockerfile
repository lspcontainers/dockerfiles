FROM node:14.16.1-alpine

ENV VERSION="1.17.0"

RUN npm install -g bash-language-server@${VERSION}

CMD [ "bash-language-server", "start" ]
