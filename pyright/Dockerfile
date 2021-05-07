FROM node:14.16.1-alpine

ENV VERSION="1.1.137"

RUN npm install -g pyright@${VERSION}

CMD [ "pyright-langserver", "--stdio" ]
