FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    pyright

CMD [ "pyright-langserver", "--stdio" ]
