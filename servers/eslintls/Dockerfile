FROM alpine:3.15.0

WORKDIR /tmp

RUN apk add --no-cache \
  nodejs \
  npm \
  git \
&& git clone --depth=1 https://github.com/Microsoft/vscode-eslint \
&& cd vscode-eslint \
&& npm install \
&& npm run compile \
&& cd server \
&& npm install --production \
&& mv out /root/vscode-eslint-language-server \
&& mv package.json node_modules /root/vscode-eslint-language-server/ \
&& cd ../.. \
&& rm -rf vscode-eslint

CMD [ "/usr/bin/node", "/root/vscode-eslint-language-server/eslintServer.js", "--stdio" ]
