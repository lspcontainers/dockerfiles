FROM alpine

RUN apk add --no-cache \
    bash \
    go \
    shadow \
    sudo

ENV GO111MODULE="on"

RUN userdel guest \
    && groupdel users \
    && addgroup lspcontainers \
    && adduser -G lspcontainers -h /home/lspcontainers -D lspcontainers \
    && echo '%lspcontainers ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/lspcontainers

USER lspcontainers

ENV GOBIN="/home/lspcontainers/.bin"
ENV PATH="${GOBIN}:$PATH"

RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go install github.com/ramya-rao-a/go-outline@latest \
    && go install github.com/cweill/gotests/gotests@latest \
    && go install github.com/fatih/gomodifytags@latest \
    && go install github.com/josharian/impl@latest \
    && go install github.com/haya14busa/goplay/cmd/goplay@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@latest \
    && go install golang.org/x/tools/gopls@latest

COPY --chown=lspcontainers:lspcontainers \
    docker_entrypoint.sh /home/lspcontainers/docker_entrypoint.sh

CMD [ "/home/lspcontainers/docker_entrypoint.sh" ]
