FROM python:3.9-alpine as build

RUN apk add --no-cache build-base
RUN python3 -m venv /venv
WORKDIR /venv
ARG VERSION="1.0.1"
RUN /venv/bin/pip install python-lsp-server[all]==${VERSION}


FROM python:3.9-alpine

RUN apk add --no-cache
WORKDIR /venv
COPY --from=build /venv .
ENV PATH="/venv/bin:$PATH"
CMD [ "/venv/bin/pylsp" ]
