FROM rust:alpine as build
RUN apk add -U --no-cache musl-dev && rm -rf /var/cache/apk/
RUN cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide

FROM alpine
COPY --from=build /usr/local/cargo/bin/markdown-oxide /usr/bin/
CMD ["markdown-oxide"]
