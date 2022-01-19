FROM alpine:3.15.0 as build

RUN apk add --no-cache --virtual \
  build-deps \
  curl \
  gnupg

WORKDIR /build

RUN curl --proto '=https' --tlsv1.2 -fsSLO https://releases.hashicorp.com/terraform-ls/0.25.2/terraform-ls_0.25.2_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/0.25.2/terraform-ls_0.25.2_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform-ls/0.25.2/terraform-ls_0.25.2_SHA256SUMS.sig \
  --next -fsSLO https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip \
  --next -fsSLO https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_SHA256SUMS \
  --next -fsSLO https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_SHA256SUMS.sig \
  --next -s -o hashicorp.asc https://keybase.io/hashicorp/pgp_keys.asc \
  && gpg --import ./hashicorp.asc \
  && grep terraform-ls_0.25.2_linux_amd64.zip terraform-ls_0.25.2_SHA256SUMS > SHA256SUMS \
  && grep terraform_1.1.3_linux_amd64.zip terraform_1.1.3_SHA256SUMS > TERRAFORM_SHA256SUMS \
  && gpg --verify terraform-ls_0.25.2_SHA256SUMS.sig terraform-ls_0.25.2_SHA256SUMS \
  && gpg --verify terraform_1.1.3_SHA256SUMS.sig terraform_1.1.3_SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && sha256sum -c TERRAFORM_SHA256SUMS \
  && unzip terraform-ls_0.25.2_linux_amd64.zip \
  && unzip terraform_1.1.3_linux_amd64.zip

FROM alpine:3.15.0

COPY --from=build /build/terraform-ls /usr/bin/terraform-ls
COPY --from=build /build/terraform /usr/bin/terraform

CMD [ "/usr/bin/terraform-ls", "serve" ]
