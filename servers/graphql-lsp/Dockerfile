FROM alpine:3.22.1

ARG VERSION=3.5.0
LABEL version="${VERSION}"

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    graphql-language-service-cli@${VERSION}

CMD [ "graphql-lsp", "server" , "-m", "stream" ]
