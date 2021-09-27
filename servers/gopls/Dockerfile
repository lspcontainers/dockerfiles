FROM alpine:3.13.5

RUN apk add --no-cache \
  go \
  git

ENV GO111MODULE="on"

ARG VERSION

RUN go get github.com/uudashr/gopkgs/v2/cmd/gopkgs \
  && go get github.com/ramya-rao-a/go-outline \
  && go get github.com/cweill/gotests/gotests \
  && go get github.com/fatih/gomodifytags \
  && go get github.com/josharian/impl \
  && go get github.com/haya14busa/goplay/cmd/goplay \
  && go get github.com/go-delve/delve/cmd/dlv \
  && go get github.com/go-delve/delve/cmd/dlv@master \
  && go get honnef.co/go/tools/cmd/staticcheck \
  && go get golang.org/x/tools/gopls@v${VERSION}

CMD [ "/root/go/bin/gopls" ]
