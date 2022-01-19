FROM alpine:3.15.0

RUN apk add --no-cache \
  build-base \
  clang-extra-tools

CMD [ "clangd", "--background-index" ]
