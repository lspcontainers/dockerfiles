FROM golang:latest as build

WORKDIR /go

RUN GO111MODULE=on go get golang.org/x/tools/gopls@latest

CMD gopls
