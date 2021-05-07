FROM node:14.16.1-alpine

ENV VERSION="0.18.0"

RUN npm install -g yaml-language-server@${VERSION}

CMD [ "yaml-language-server", "--stdio" ]
