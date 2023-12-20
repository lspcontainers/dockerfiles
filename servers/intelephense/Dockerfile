FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    intelephense

CMD [ "intelephense", "--stdio" ]
