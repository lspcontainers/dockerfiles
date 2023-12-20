FROM alpine

RUN apk add --no-cache \
    git \
    nodejs \
    npm

WORKDIR /tmp

RUN git clone --depth=1 https://github.com/Microsoft/vscode-eslint

WORKDIR /tmp/vscode-eslint

RUN npm install && npm run compile

WORKDIR /tmp/vscode-eslint/server

RUN npm install --production \
    && mv out /root/vscode-eslint-language-server \
    && mv package.json node_modules /root/vscode-eslint-language-server/ \
    && rm -rf /tmp/vscode-eslint

CMD [ "/usr/bin/node", "/root/vscode-eslint-language-server/eslintServer.js", "--stdio" ]
