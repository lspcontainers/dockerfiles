FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  svelte-language-server

CMD [ "/usr/bin/svelteserver", "--stdio" ]

