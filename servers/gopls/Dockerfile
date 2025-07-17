FROM alpine:3.22.1

ARG VERSION=0.19.1
LABEL version="${VERSION}"

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

RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@v2.1.2 \
    && go install github.com/ramya-rao-a/go-outline@9736a4bde949f321d201e5eaa5ae2bcde011bf00 \
    && go install github.com/cweill/gotests/gotests@v1.6.0 \
    && go install github.com/fatih/gomodifytags@v1.17.0 \
    && go install github.com/josharian/impl@v1.4.0 \
    && go install github.com/haya14busa/goplay/cmd/goplay@v1.0.0 \
    && go install github.com/go-delve/delve/cmd/dlv@v1.25.0 \
    && go install honnef.co/go/tools/cmd/staticcheck@2025.1.1 \
    && go install golang.org/x/tools/gopls@v${VERSION}

COPY --chown=lspcontainers:lspcontainers \
    docker_entrypoint.sh /home/lspcontainers/docker_entrypoint.sh

CMD [ "/home/lspcontainers/docker_entrypoint.sh" ]
