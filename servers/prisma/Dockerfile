FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    @prisma/language-server@6.9.1

CMD [ "prisma-language-server", "--stdio" ]
