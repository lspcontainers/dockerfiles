FROM mcr.microsoft.com/powershell:7.5-alpine-3.20

WORKDIR /srv

RUN apk add --no-cache \
  curl \
  unzip \
  && curl -L -o PowerShellEditorServices.zip https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.4.8/PowerShellEditorServices.zip \
  && unzip PowerShellEditorServices.zip \
  && rm -fr PowerShellEditorServices.zip

CMD ["/usr/bin/pwsh", "-NoLogo", "-NoProfile", "-Command", "/srv/PowerShellEditorServices/Start-EditorServices.ps1 -BundledModulesPath /PowerShellEditorServices -LogPath /PowerShellEditorServices/logs.log -SessionDetailsPath /PowerShellEditorServices/session.json -FeatureFlags @() -AdditionalModules @() -HostName 'lspcontainers' -HostProfileId 'lspcontainers' -HostVersion 1.0.0 -Stdio -LogLevel Normal"]
