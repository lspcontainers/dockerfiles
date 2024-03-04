FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    typescript-language-server \
    @vue/typescript-plugin \
    typescript

CMD [ "typescript-language-server", "--stdio" ]
