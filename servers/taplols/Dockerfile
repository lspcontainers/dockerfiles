FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    @taplo/lsp

CMD [ "taplo", "lsp", "stdio" ]
