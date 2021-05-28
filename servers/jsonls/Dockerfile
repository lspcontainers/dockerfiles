FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  vscode-json-languageserver@${VERSION}

CMD [ "/usr/bin/vscode-json-languageserver", "--stdio" ]
