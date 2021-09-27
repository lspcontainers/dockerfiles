FROM mcr.microsoft.com/powershell:latest

WORKDIR /PowerShellEditorServices

RUN apt-get update -qq \
  && apt-get install \
  curl \
  wget \
  jq \
  unzip -y

ARG VERSION

RUN curl -sL \
  https://api.github.com/repos/PowerShell/PowerShellEditorServices/releases/latest \
  | jq -r '.assets[].browser_download_url' \
  | wget -qi - \
  && unzip PowerShellEditorServices.zip -d ./ \
  && rm -fr PowerShellEditorServices.zip

CMD ["/usr/bin/pwsh", "-NoLogo", "-NoProfile", "-Command", "/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1 -BundledModulesPath /PowerShellEditorServices -LogPath /PowerShellEditorServices/logs.log -SessionDetailsPath /PowerShellEditorServices/session.json -FeatureFlags @() -AdditionalModules @() -HostName 'lspcontainers' -HostProfileId 'lspcontainers' -HostVersion 1.0.0 -Stdio -LogLevel Diagnostic"]
