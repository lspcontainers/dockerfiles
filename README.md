# lspcontainers/dockerfiles

🚀 **Dockerfiles for Language Server Protocol (LSP) servers** - Containerized language servers for use with [lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim).

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-lspcontainers-blue?logo=docker)](https://hub.docker.com/u/lspcontainers)
[![Build Status](https://img.shields.io/github/actions/workflow/status/lspcontainers/dockerfiles/build-and-push.yml?branch=main)](https://github.com/lspcontainers/dockerfiles/actions)
[![License](https://img.shields.io/github/license/lspcontainers/dockerfiles)](LICENSE)

## 🌟 What is this?

This repository provides **production-ready Docker containers** for 25+ Language Server Protocol (LSP) servers, designed to work seamlessly with the **[lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim)** Neovim plugin.

### 🎯 **How it works:**
1. **Docker containers** provide isolated, reproducible LSP server environments
2. **[lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim)** plugin automatically manages these containers in Neovim
3. **Zero local installation** - no need to install language servers on your system

Perfect for:
- **Consistent development environments** across teams and machines
- **Clean system** - no language server pollution on your host
- **Reproducible builds** with pinned package versions
- **Easy switching** between language server versions

## 🛠️ Supported Language Servers

| Language | Server | Container | Version |
|----------|--------|-----------|---------|
| **Bash** | bash-language-server | `lspcontainers/bash-language-server` | ![Version](https://img.shields.io/badge/version-5.6.0-blue) |
| **C/C++** | clangd | `lspcontainers/clangd-language-server` | ![Version](https://img.shields.io/badge/version-20.1.8-blue) |
| **C#** | omnisharp | `lspcontainers/omnisharp-language-server` | ![Version](https://img.shields.io/badge/version-1.39.12-blue) |
| **CSS/SCSS/Less** | vscode-css-languageserver | `lspcontainers/css-language-server` | ![Version](https://img.shields.io/badge/version-4.10.0-blue) |
| **Deno** | deno-lsp | `lspcontainers/deno-language-server` | ![Version](https://img.shields.io/badge/version-2.4.2-blue) |
| **Docker** | dockerfile-ls | `lspcontainers/docker-language-server` | ![Version](https://img.shields.io/badge/version-0.14.0-blue) |
| **ESLint** | eslint-languageserver | `lspcontainers/eslint-language-server` | ![Version](https://img.shields.io/badge/version-latest-blue) |
| **Go** | gopls | `lspcontainers/gopls` | ![Version](https://img.shields.io/badge/version-0.19.1-blue) |
| **GraphQL** | graphql-language-service | `lspcontainers/graphql-language-server` | ![Version](https://img.shields.io/badge/version-3.5.0-blue) |
| **HTML** | html-languageserver | `lspcontainers/html-language-server` | ![Version](https://img.shields.io/badge/version-1.4.0-blue) |
| **JavaScript/TypeScript** | typescript-language-server | `lspcontainers/typescript-language-server` | ![Version](https://img.shields.io/badge/version-4.3.4-blue) |
| **JSON** | vscode-json-languageserver | `lspcontainers/json-language-server` | ![Version](https://img.shields.io/badge/version-4.10.0-blue) |
| **Lua** | lua-language-server | `lspcontainers/lua-language-server` | ![Version](https://img.shields.io/badge/version-3.14.0-blue) |
| **PHP** | intelephense | `lspcontainers/php-language-server` | ![Version](https://img.shields.io/badge/version-1.14.4-blue) |
| **PowerShell** | powershell-es | `lspcontainers/powershell-language-server` | ![Version](https://img.shields.io/badge/version-4.3.0-blue) |
| **Prisma** | prisma-language-server | `lspcontainers/prisma-language-server` | ![Version](https://img.shields.io/badge/version-6.9.1-blue) |
| **Python** | pylsp | `lspcontainers/python-lsp-server` | ![Version](https://img.shields.io/badge/version-1.12.0-blue) |
| **Python** | pyright | `lspcontainers/pyright-language-server` | ![Version](https://img.shields.io/badge/version-1.1.377-blue) |
| **Ruby** | solargraph | `lspcontainers/ruby-language-server` | ![Version](https://img.shields.io/badge/version-0.55.1-blue) |
| **Rust** | rust-analyzer | `lspcontainers/rust-analyzer` | ![Version](https://img.shields.io/badge/version-1.88.0-blue) |
| **Svelte** | svelte-language-server | `lspcontainers/svelte-language-server` | ![Version](https://img.shields.io/badge/version-0.17.16-blue) |
| **Tailwind CSS** | tailwindcss-language-server | `lspcontainers/tailwindcss-language-server` | ![Version](https://img.shields.io/badge/version-0.14.25-blue) |
| **Terraform** | terraform-ls | `lspcontainers/terraform-ls` | ![Version](https://img.shields.io/badge/version-0.36.5-blue) |
| **Vue** | volar | `lspcontainers/volar-language-server` | ![Version](https://img.shields.io/badge/version-1.8.11-blue) |
| **Vue** | vuels (legacy) | `lspcontainers/vue-language-server` | ![Version](https://img.shields.io/badge/version-0.8.5-blue) |
| **XML** | lemminx | `lspcontainers/xml-language-server` | ![Version](https://img.shields.io/badge/version-0.27.0-blue) |
| **YAML** | yaml-language-server | `lspcontainers/yaml-language-server` | ![Version](https://img.shields.io/badge/version-1.18.0-blue) |

## 🚀 Quick Start

### Using with lspcontainers.nvim (Recommended)

These containers are designed to work with the **[lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim)** plugin.

👉 **[See the plugin documentation](https://github.com/lspcontainers/lspcontainers.nvim)** for installation and setup instructions.

### Building Containers Locally

```bash
# Clone the repository
git clone https://github.com/lspcontainers/dockerfiles.git
cd dockerfiles

# Build a specific server
docker-compose build gopls

# Build all servers
docker-compose build

# Build all servers in parallel (faster!)
docker-compose build --parallel
```

## 📋 Prerequisites

- [Docker Engine](https://docs.docker.com/engine/install/) (20.10+)
- [Docker Compose](https://docs.docker.com/compose/install) (2.0+)

## 🏗️ Architecture & Design

### 🔒 **Reproducible Builds**
All containers use **pinned package versions** for complete reproducibility:
- **Base images**: Specific Alpine/Debian versions
- **System packages**: Exact apk/apt package versions
- **Language packages**: Pinned npm, gem, pip, go module versions

### 🏔️ **Minimal & Secure**
- **Alpine Linux base** for minimal attack surface
- **Multi-stage builds** where applicable
- **Non-root users** for security
- **Distroless principles** - only essential components

### 🔄 **Automated Updates**
- **Daily builds** via GitHub Actions
- **Dependency scanning** and security updates
- **Version tracking** of upstream language servers

## 🤝 Contributing

We're actively looking for contributors! Here's how you can help:

### 🐛 **Report Issues**
Found a bug or have a feature request? [Open an issue](https://github.com/lspcontainers/dockerfiles/issues/new)!

### 🔧 **Add New Language Servers**
Want to add support for a new language? We'd love your contribution!

1. **Fork the repository**
2. **Create a new directory** under `servers/your-language-server/`
3. **Write a Dockerfile** following our patterns:
   ```dockerfile
   FROM alpine:3.22.1

   ARG VERSION=1.2.3
   LABEL version="${VERSION}"

   RUN apk add --no-cache \
     nodejs=22.16.0-r2 \
     npm=11.3.0-r0 \
     && npm install -g \
       your-language-server@${VERSION}

   CMD [ "your-language-server", "--stdio" ]
   ```
4. **Add to docker-compose.yaml**
5. **Test your build**: `docker-compose build your-server`
6. **Submit a pull request**

### 🛠️ **Improve Existing Containers**
- Update language server versions
- Improve Dockerfile efficiency
- Add missing tools or dependencies
- Enhance security

### 📚 **Documentation**
- Improve README files
- Add usage examples
- Write integration guides
- Create tutorials

## 🏷️ Container Versioning

Every container provides two tags:

- **`latest`** - Latest build from main branch
- **`vX.Y.Z`** - Pinned version of the language server

```bash
# Always latest
docker pull lspcontainers/gopls:latest

# Specific version for production
docker pull lspcontainers/gopls:v0.19.1
```

### 🔄 **Updating Dockerfile Versions**

Each Dockerfile includes version information that controls both the language server version and container tagging:

```dockerfile
# Version is declared at the top
ARG VERSION=1.2.3
LABEL version="${VERSION}"

# Version variable is used in installation
RUN npm install -g your-language-server@${VERSION}
```

**To update a language server version:**

1. **Edit the Dockerfile** in `servers/your-server/Dockerfile`
2. **Update the VERSION argument** to the new version
3. **Test the build** locally: `docker-compose build your-server`
4. **Submit a pull request** with your changes

The CI/CD pipeline automatically:
- Extracts the version from the `LABEL version` directive
- Tags the image with both `latest` and the specific version
- Pushes to Docker Hub with proper versioning

**Example version update:**
```dockerfile
# Before
ARG VERSION=1.2.3

# After  
ARG VERSION=1.3.0
```

This ensures reproducible builds and allows users to pin to specific language server versions.

### 📊 Project Stats

- **25+ Language Servers** supported
- **100% reproducible builds** with pinned versions
- **Multi-architecture support** (amd64, arm64)
- **Active community** with regular contributions

---

**Ready to contribute?** Check out our [Contributing Guide](CONTRIBUTING.md) and join our community of developers making language servers more accessible!
