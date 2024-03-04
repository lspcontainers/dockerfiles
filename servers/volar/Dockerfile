FROM alpine

RUN apk add --no-cache nodejs npm

ENV VERSION=2.0.3

RUN npm install -g @vue/language-server@$VERSION @vue/typescript-plugin

CMD [ "vue-language-server", "--stdio" ]
