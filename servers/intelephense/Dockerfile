FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  intelephense@${VERSION}
  

CMD [ "/usr/bin/intelephense", "--stdio" ]
