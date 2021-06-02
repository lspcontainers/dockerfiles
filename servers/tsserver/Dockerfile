FROM alpine:3.13.5

RUN apk add --no-cache \
  nodejs \
  npm

ARG VERSION

ENV TSVERSION="4.3.2"

RUN npm install -g \
  typescript-language-server@${VERSION} \
  typescript@${TSVERSION}

CMD [ "/usr/bin/typescript-language-server", "--stdio" ]
