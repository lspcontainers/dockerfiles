FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    typescript-language-server \
    typescript

CMD [ "typescript-language-server", "--stdio" ]
