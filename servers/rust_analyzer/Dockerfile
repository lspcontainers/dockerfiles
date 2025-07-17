ARG VERSION=1.88.0

FROM rust:${VERSION}-alpine3.22

LABEL version="${VERSION}"

RUN rustup component add rust-analyzer

CMD [ "rust-analyzer" ]
