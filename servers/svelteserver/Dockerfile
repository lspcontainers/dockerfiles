FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  svelte-language-server

CMD [ "/usr/bin/svelteserver", "--stdio" ]
