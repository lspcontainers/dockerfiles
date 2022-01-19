FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    svelte-language-server

CMD [ "svelteserver", "--stdio" ]
