FROM alpine:3.13.5 as build

ENV VERSION="1.1.137"

RUN apk add --no-cache nodejs npm

RUN npm install -g pyright@${VERSION}

CMD [ "pyright-langserver", "--stdio" ]
