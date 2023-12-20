FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
    vls

CMD [ "vls", "--stdio" ]
