FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  pyright@${VERSION}

CMD [ "/usr/bin/pyright-langserver", "--stdio" ]
