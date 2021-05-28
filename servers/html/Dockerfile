FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  vscode-html-languageserver-bin@${VERSION}

CMD [ "/usr/bin/html-languageserver", "--stdio" ]
