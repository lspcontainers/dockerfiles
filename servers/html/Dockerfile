FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    vscode-html-languageserver-bin

CMD [ "html-languageserver", "--stdio" ]
