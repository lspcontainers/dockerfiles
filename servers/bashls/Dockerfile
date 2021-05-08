FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  bash-language-server@${VERSION}

CMD [ "/usr/bin/bash-language-server", "start" ]
