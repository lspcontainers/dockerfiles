FROM alpine:3.22.1

ARG VERSION=5.6.0
LABEL version="${VERSION}"

# using npm breaks shellcheck download of its binary from api.github.com
# running shellcheck -V forces it to download its binary during build
RUN apk add --no-cache \
  nodejs=22.16.0-r2 \
  yarn=1.22.22-r1 \
  && yarn global add \
    shellcheck@3.1.0 \
    bash-language-server@${VERSION} \
  && shellcheck -V

CMD [ "bash-language-server", "start" ]
