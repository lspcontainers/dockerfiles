FROM alpine:3.22.1

ARG VERSION=20.1.8
LABEL version="${VERSION}"

RUN apk add --no-cache \
  build-base=0.5-r3 \
  clang-extra-tools=${VERSION}-r0

CMD [ "clangd", "--background-index" ]
