FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  vscode-json-languageserver

CMD [ "/usr/bin/vscode-json-languageserver", "--stdio" ]
