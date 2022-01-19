FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    typescript-language-server \
    typescript

CMD [ "typescript-language-server", "--stdio" ]
