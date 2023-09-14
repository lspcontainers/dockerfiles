FROM alpine:3.18

RUN apk add --no-cache nodejs npm

ENV VERSION=1.8.11

RUN npm install -g @vue/language-server@$VERSION

CMD [ "vue-language-server", "--stdio" ]
