FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    @prisma/language-server

CMD [ "prisma-language-server", "--stdio" ]
