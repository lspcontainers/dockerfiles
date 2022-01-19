FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    pyright

CMD [ "/usr/bin/pyright-langserver", "--stdio" ]
