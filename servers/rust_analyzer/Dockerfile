FROM alpine:3.13.5

RUN apk add --no-cache \
  curl \
  rust

ARG VERSION

RUN curl -L "https://github.com/rust-analyzer/rust-analyzer/releases/download/${VERSION}/rust-analyzer-linux" -o /usr/bin/rust-analyzer \
  && chmod 755 /usr/bin/rust-analyzer

CMD [ "/usr/bin/rust-analyzer" ]
