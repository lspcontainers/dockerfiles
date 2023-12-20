FROM alpine

RUN apk add --no-cache \
  build-base \
  clang-extra-tools

CMD [ "clangd", "--background-index" ]
