FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    vscode-langservers-extracted

CMD [ "vscode-json-language-server", "--stdio" ]
