FROM alpine:3.13.5 as build

RUN apk add --no-cache build-base python3 python3-dev py3-pip
RUN python3 -m venv /venv
WORKDIR /venv
ARG VERSION="1.0.1"
RUN /venv/bin/pip install python-lsp-server[all]==${VERSION}


FROM alpine:3.13.5

WORKDIR /venv
COPY --from=build /venv .
ENV PATH="/venv/bin:$PATH"
CMD [ "/venv/bin/pylsp" ]
