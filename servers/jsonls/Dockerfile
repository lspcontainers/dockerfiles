FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    vscode-langservers-extracted

CMD [ "vscode-json-language-server", "--stdio" ]
