FROM alpine:3.22.1

RUN apk add --no-cache \
    git=2.49.1-r0 \
    nodejs=22.16.0-r2 \
    npm=11.3.0-r0

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
