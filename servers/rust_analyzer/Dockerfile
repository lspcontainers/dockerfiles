FROM alpine:3.13.5

RUN apk add --no-cache \
  bash \
  curl \
  gcc

ARG VERSION

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y \
  && source $HOME/.cargo/env \
  && rustup toolchain install nightly \
  && rustup component add rust-analyzer-preview

COPY docker_entrypoint.sh /docker_entrypoint.sh

ENTRYPOINT [ "/docker_entrypoint.sh" ]

CMD [ "/root/.rustup/toolchains/nightly-x86_64-unknown-linux-musl/bin/rust-analyzer" ]
