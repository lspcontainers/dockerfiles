FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  vscode-html-languageserver-bin

CMD [ "/usr/bin/html-languageserver", "--stdio" ]
