FROM alpine:3.22.1

ARG VERSION=3.14.0
LABEL version="${VERSION}"

RUN apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ lua-language-server=${VERSION}-r0

CMD [ "lua-language-server" ]
