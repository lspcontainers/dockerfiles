FROM alpine:3.13.5 as build

RUN apk add --no-cache --virtual build-deps gnupg curl

WORKDIR /build

ARG VERSION
ARG TERRAFORM_VERSION=0.15.3

RUN curl --proto '=https' --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${VERSION}/terraform-ls_${VERSION}_SHA256SUMS.sig \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && echo "$(grep terraform-ls_${VERSION}_linux_amd64.zip terraform-ls_${VERSION}_SHA256SUMS)" > SHA256SUMS \
  && echo "$(grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS)" > TERRAFORM_SHA256SUMS \
  && gpg --verify terraform-ls_${VERSION}_SHA256SUMS.sig terraform-ls_${VERSION}_SHA256SUMS \
  && gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && sha256sum -c TERRAFORM_SHA256SUMS \
  && unzip terraform-ls_${VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM alpine:3.13.5

COPY --from=build /build/terraform-ls /usr/bin/terraform-ls
COPY --from=build /build/terraform /usr/bin/terraform

CMD [ "/usr/bin/terraform-ls", "serve" ]
