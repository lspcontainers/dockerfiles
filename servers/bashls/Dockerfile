FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  bash-language-server

CMD [ "/usr/bin/bash-language-server", "start" ]
