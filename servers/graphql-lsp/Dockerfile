FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    graphql-language-service-cli

CMD [ "graphql-lsp", "server" , "-m", "stream" ]
