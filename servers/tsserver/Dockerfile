FROM alpine:3.22.1

ARG VERSION=4.3.4
LABEL version="${VERSION}"

RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  npm=11.3.0-r0 \
  && npm install -g \
    typescript-language-server@${VERSION} \
    @vue/typescript-plugin@2.1.6 \
    typescript@5.5.4

CMD [ "typescript-language-server", "--stdio" ]
