FROM alpine:3.22.1

RUN apk add --no-cache \
    bash=5.2.37-r0 \
    git=2.49.1-r0 \
    go=1.24.4-r0 \
    shadow=4.17.3-r0 \
    sudo=1.9.17_p1-r0

ENV GO111MODULE="on"

RUN userdel guest \
    && groupdel users \
    && addgroup lspcontainers \
    && adduser -G lspcontainers -h /home/lspcontainers -D lspcontainers \
    && echo '%lspcontainers ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/lspcontainers

USER lspcontainers

ENV GOBIN="/home/lspcontainers/.bin"
ENV PATH="${GOBIN}:$PATH"

RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@v2.3.0 \
    && go install github.com/ramya-rao-a/go-outline@v0.0.0-20230705182323-5c2c3ef6aa00 \
    && go install github.com/cweill/gotests/gotests@v1.6.3 \
    && go install github.com/fatih/gomodifytags@v1.17.0 \
    && go install github.com/josharian/impl@v1.4.0 \
    && go install github.com/haya14busa/goplay/cmd/goplay@v1.0.0 \
    && go install github.com/go-delve/delve/cmd/dlv@v1.24.2 \
    && go install honnef.co/go/tools/cmd/staticcheck@2024.1.1 \
    && go install golang.org/x/tools/gopls@v0.17.0

COPY --chown=lspcontainers:lspcontainers \
    docker_entrypoint.sh /home/lspcontainers/docker_entrypoint.sh

CMD [ "/home/lspcontainers/docker_entrypoint.sh" ]
