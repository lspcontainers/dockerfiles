FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    @prisma/language-server

CMD [ "prisma-language-server", "--stdio" ]
