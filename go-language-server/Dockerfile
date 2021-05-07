FROM golang:1.16.4

WORKDIR /go

RUN GO111MODULE=on go get golang.org/x/tools/gopls@latest

CMD gopls
