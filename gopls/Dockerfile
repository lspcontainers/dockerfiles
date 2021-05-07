FROM golang:1.16.4-alpine

ENV GO111MODULE="on"

RUN apk add --no-cache g++ gcc

RUN go get github.com/klauspost/asmfmt/cmd/asmfmt \
  && go get github.com/go-delve/delve/cmd/dlv \
  && go get github.com/kisielk/errcheck \
  && go get github.com/davidrjenni/reftools/cmd/fillstruct \
  && go get github.com/rogpeppe/godef \
  && go get golang.org/x/tools/cmd/goimports \
  && go get golang.org/x/lint/golint \
  && go get golang.org/x/tools/gopls \
  && go get github.com/golangci/golangci-lint/cmd/golangci-lint \
  && go get honnef.co/go/tools/cmd/staticcheck \
  && go get github.com/fatih/gomodifytags \
  && go get golang.org/x/tools/cmd/gorename \
  && go get github.com/jstemmer/gotags \
  && go get golang.org/x/tools/cmd/guru \
  && go get github.com/josharian/impl \
  && go get honnef.co/go/tools/cmd/keyify \
  && go get github.com/fatih/motion \
  && go get github.com/koron/iferr

CMD [ "gopls" ]
