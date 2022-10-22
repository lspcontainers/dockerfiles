FROM alpine:3.15.0

ENV PATH "/root/.cargo/bin:/root/.rustup/toolchains/stable-x86_64-unknown-linux-musl/bin:$PATH"

RUN apk add --no-cache \
    bash \
    curl \
    gcc

RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/sh.rustup.rs \
    && chmod +x /tmp/sh.rustup.rs \
    && /tmp/sh.rustup.rs --default-toolchain none -y \
    && rm -rf /tmp/sh.rustup.rs \
    && . "$HOME"/.cargo/env \
    && rustup toolchain install stable \
    && rustup component add rust-analyzer \
    && rustup component add rust-src

CMD [ "rust-analyzer" ]
