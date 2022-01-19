FROM alpine:3.15.0

RUN apk add --no-cache \
  nodejs \
  npm

RUN npm install -g \
  vls

CMD [ "/usr/bin/vls", "--stdio" ]
