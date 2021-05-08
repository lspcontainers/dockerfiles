FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

RUN npm install -g \
  typescript-language-server@${VERSION} \
  typescript

CMD [ "/usr/bin/typescript-language-server", "--stdio" ]
