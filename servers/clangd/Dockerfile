FROM alpine:3.14

RUN apk add --no-cache build-base clang-extra-tools

CMD [ "/usr/bin/clangd", "--background-index" ]
