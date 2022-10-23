FROM alpine:3.15.0

RUN apk add --no-cache \
    bash \
    curl \
    gcc \
    shadow \
    sudo

RUN userdel guest \
    && groupdel users \
    && addgroup lspcontainers \
    && adduser -G lspcontainers -h /home/lspcontainers -D lspcontainers \
    && echo '%lspcontainers ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/lspcontainers

USER lspcontainers

ENV PATH "/home/lspcontainers/.cargo/bin:/home/lspcontainers/.rustup/toolchains/stable-x86_64-unknown-linux-musl/bin:$PATH"

RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/sh.rustup.rs \
    && chmod +x /tmp/sh.rustup.rs \
    && /tmp/sh.rustup.rs --default-toolchain none -y \
    && rm -rf /tmp/sh.rustup.rs \
    && . "$HOME"/.cargo/env \
    && rustup toolchain install stable \
    && rustup component add rust-analyzer \
    rust-src

COPY docker_entrypoint.sh /home/lspcontainers/docker_entrypoint.sh

ENTRYPOINT [ "/home/lspcontainers/docker_entrypoint.sh" ]
