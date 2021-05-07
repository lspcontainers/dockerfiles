FROM node:14.16.1-alpine

ENV VERSION="0.5.1"

RUN npm install -g typescript-language-server@${VERSION} typescript

CMD [ "typescript-language-server", "--stdio" ]
