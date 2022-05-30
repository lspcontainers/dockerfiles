FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    @prisma/language-server

CMD [ "prisma-language-server", "--stdio" ]
