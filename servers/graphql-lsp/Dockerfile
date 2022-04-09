FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    graphql-language-service-cli

CMD [ "graphql-lsp", "server" , "-m", "stream" ]
