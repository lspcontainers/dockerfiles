FROM alpine:3.22.1

RUN apk add --no-cache \
  build-base \
  clang-extra-tools

CMD [ "clangd", "--background-index" ]
