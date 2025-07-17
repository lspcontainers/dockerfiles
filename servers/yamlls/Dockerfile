FROM alpine:3.22.1

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    yaml-language-server@1.18.0

CMD [ "yaml-language-server", "--stdio" ]
