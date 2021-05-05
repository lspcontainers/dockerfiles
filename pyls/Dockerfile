FROM alpine:3.13.5 as build

RUN apk add --no-cache build-base py3-pip python3-dev zeromq-dev

RUN python3 -m venv /venv
WORKDIR /venv
ADD requirements.txt /venv/
RUN /venv/bin/pip install -r /venv/requirements.txt


FROM alpine:3.13.5

RUN apk add --no-cache python3 zeromq

WORKDIR /venv
COPY --from=build /venv .
ENV PATH="/venv/bin:$PATH"

CMD [ "/venv/bin/pyls" ]
