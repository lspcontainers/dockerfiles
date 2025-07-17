FROM mcr.microsoft.com/powershell:7.5-alpine-3.20

ARG VERSION=4.3.0
LABEL version="${VERSION}"

WORKDIR /srv

RUN apk add --no-cache \
  curl=8.12.1-r0 \
  unzip=6.0-r14 \
  && curl -L -o PowerShellEditorServices.zip https://github.com/PowerShell/PowerShellEditorServices/releases/download/v${VERSION}/PowerShellEditorServices.zip \
  && unzip PowerShellEditorServices.zip \
  && rm -fr PowerShellEditorServices.zip

CMD ["/usr/bin/pwsh", "-NoLogo", "-NoProfile", "-Command", "/srv/PowerShellEditorServices/Start-EditorServices.ps1 -BundledModulesPath /PowerShellEditorServices -LogPath /PowerShellEditorServices/logs.log -SessionDetailsPath /PowerShellEditorServices/session.json -FeatureFlags @() -AdditionalModules @() -HostName 'lspcontainers' -HostProfileId 'lspcontainers' -HostVersion 1.0.0 -Stdio -LogLevel Normal"]
