# lspcontainers/dockerfiles

🚀 **Dockerfiles for Language Server Protocol (LSP) servers** - Containerized language servers for use with [lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim).

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-lspcontainers-blue?logo=docker)](https://hub.docker.com/u/lspcontainers)
[![Build Status](https://img.shields.io/github/actions/workflow/status/lspcontainers/dockerfiles/build-image.yml?branch=main)](https://github.com/lspcontainers/dockerfiles/actions)
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

| Language | Server | Container |
|----------|--------|-----------|
| **Bash** | bash-language-server | `lspcontainers/bash-language-server` |
| **C/C++** | clangd | `lspcontainers/clangd-language-server` |
| **C#** | omnisharp | `lspcontainers/omnisharp-language-server` |
| **CSS/SCSS/Less** | vscode-css-languageserver | `lspcontainers/css-language-server` |
| **Deno** | deno-lsp | `lspcontainers/deno-language-server` |
| **Docker** | dockerfile-ls | `lspcontainers/docker-language-server` |
| **ESLint** | eslint-languageserver | `lspcontainers/eslint-language-server` |
| **Go** | gopls | `lspcontainers/gopls` |
| **GraphQL** | graphql-language-service | `lspcontainers/graphql-language-server` |
| **HTML** | html-languageserver | `lspcontainers/html-language-server` |
| **JavaScript/TypeScript** | typescript-language-server | `lspcontainers/typescript-language-server` |
| **JSON** | vscode-json-languageserver | `lspcontainers/json-language-server` |
| **Lua** | lua-language-server | `lspcontainers/lua-language-server` |
| **PHP** | intelephense | `lspcontainers/php-language-server` |
| **PowerShell** | powershell-es | `lspcontainers/powershell-language-server` |
| **Prisma** | prisma-language-server | `lspcontainers/prisma-language-server` |
| **Python** | pylsp | `lspcontainers/python-lsp-server` |
| **Python** | pyright | `lspcontainers/pyright-language-server` |
| **Ruby** | solargraph | `lspcontainers/ruby-language-server` |
| **Rust** | rust-analyzer | `lspcontainers/rust-analyzer` |
| **Svelte** | svelte-language-server | `lspcontainers/svelte-language-server` |
| **Tailwind CSS** | tailwindcss-language-server | `lspcontainers/tailwindcss-language-server` |
| **Terraform** | terraform-ls | `lspcontainers/terraform-ls` |
| **Vue** | volar | `lspcontainers/volar-language-server` |
| **Vue** | vuels (legacy) | `lspcontainers/vue-language-server` |
| **XML** | lemminx | `lspcontainers/xml-language-server` |
| **YAML** | yaml-language-server | `lspcontainers/yaml-language-server` |

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
   
   RUN apk add --no-cache \
     nodejs=22.16.0-r2 \
     npm=11.3.0-r0 \
     && npm install -g \
       your-language-server@1.2.3
   
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

## 📖 Usage Examples

For configuration examples and advanced usage, see the **[lspcontainers.nvim documentation](https://github.com/lspcontainers/lspcontainers.nvim)**.

## 🔍 Development Workflow

### Local Development
```bash
# Test a single container
make test-gopls

# Lint all Dockerfiles
make lint

# Build and test all containers
make test-all
```

### 📊 Project Stats

- **25+ Language Servers** supported
- **Automated daily builds** ensuring freshness
- **100% reproducible builds** with pinned versions
- **Multi-architecture support** (amd64, arm64)
- **Active community** with regular contributions

---

## 🎯 Why LSP Containers?

**Before**: Install language servers locally, deal with version conflicts, environment setup headaches

**After**: `docker run` and you're ready to code with any language server, anywhere

---

**Ready to contribute?** Check out our [Contributing Guide](CONTRIBUTING.md) and join our community of developers making language servers more accessible!
