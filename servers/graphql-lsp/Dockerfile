FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    graphql-language-service-cli

CMD [ "graphql-lsp", "server" , "-m", "stream" ]
