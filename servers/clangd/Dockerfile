FROM alpine:3.22.1

RUN apk add --no-cache \
  build-base=0.5-r3 \
  clang-extra-tools=20.1.8-r0

CMD [ "clangd", "--background-index" ]
