FROM alpine:3.22.1

ARG VERSION=2.0.3
LABEL version="${VERSION}"

RUN apk add --no-cache nodejs=22.16.0-r2 npm=11.3.0-r0 && \
    npm install -g @vue/language-server@${VERSION} @vue/typescript-plugin

CMD [ "vue-language-server", "--stdio" ]
