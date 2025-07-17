FROM alpine:3.22.1 as build

RUN apk add --no-cache \
    build-base=0.5-r3 \
    python3=3.12.11-r0 \
    python3-dev=3.12.11-r0 \
    py3-pip=25.1.1-r0 \
  && python3 -m venv /venv

WORKDIR /venv

RUN /venv/bin/pip install "python-lsp-server[all]==1.12.0"


FROM alpine:3.22.1

RUN apk add --no-cache python3=3.12.11-r0 py3-pip=25.1.1-r0

WORKDIR /venv

COPY --from=build /venv .

ENV PATH="/venv/bin:$PATH"

CMD [ "/venv/bin/pylsp" ]
