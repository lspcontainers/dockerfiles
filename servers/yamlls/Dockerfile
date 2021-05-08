FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  yaml-language-server@${VERSION}

CMD [ "/usr/bin/yaml-language-server", "--stdio" ]
