FROM alpine:3.16.2 AS build

ARG TF_LS_VERSION=0.29.3
ARG TF_VERSION=1.3.3

RUN apk add --no-cache --virtual \
  build-deps \
  curl \
  gnupg

WORKDIR /build

RUN curl --proto '=https' \
  --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_SHA256SUMS.sig \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && grep terraform-ls_${TF_LS_VERSION}_linux_amd64.zip terraform-ls_${TF_LS_VERSION}_SHA256SUMS > SHA256SUMS \
  && grep terraform_${TF_VERSION}_linux_amd64.zip terraform_${TF_VERSION}_SHA256SUMS > TERRAFORM_SHA256SUMS \
  && gpg --verify terraform-ls_${TF_LS_VERSION}_SHA256SUMS.sig terraform-ls_${TF_LS_VERSION}_SHA256SUMS \
  && gpg --verify terraform_${TF_VERSION}_SHA256SUMS.sig terraform_${TF_VERSION}_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && sha256sum -c TERRAFORM_SHA256SUMS \
  && unzip terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
  && unzip terraform_${TF_VERSION}_linux_amd64.zip

FROM alpine:3.16.2

COPY --from=build /build/terraform-ls /usr/bin/terraform-ls
COPY --from=build /build/terraform /usr/bin/terraform

CMD [ "/usr/bin/terraform-ls", "serve" ]
