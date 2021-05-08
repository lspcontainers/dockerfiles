FROM alpine as build

ENV VERSION="2021-05-03"

WORKDIR /build

RUN apk add --no-cache curl

RUN curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/${VERSION}/rust-analyzer-linux -o /build/rust-analyzer \
    && chmod +x /build/rust-analyzer

FROM rust:latest

WORKDIR /

COPY --from=build /build/rust-analyzer .

CMD [ "/rust-analyzer" ]
