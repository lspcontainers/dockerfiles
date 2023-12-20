FROM alpine as build

RUN apk add --no-cache \
    build-base \
    python3 \
    python3-dev \
    py3-pip \
  && python3 -m venv /venv

WORKDIR /venv

RUN /venv/bin/pip install "python-lsp-server[all]"


FROM alpine

RUN apk add --no-cache python3 py3-pip

WORKDIR /venv

COPY --from=build /venv .

ENV PATH="/venv/bin:$PATH"

CMD [ "/venv/bin/pylsp" ]
