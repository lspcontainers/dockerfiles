FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    vscode-langservers-extracted@4.10.0

CMD [ "vscode-json-language-server", "--stdio" ]
