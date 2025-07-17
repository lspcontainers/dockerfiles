# lspcontainers/dockerfiles

🚀 **Dockerfiles for Language Server Protocol (LSP) servers** - Making development environments consistent, portable, and easy to manage.

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-lspcontainers-blue?logo=docker)](https://hub.docker.com/u/lspcontainers)
[![Build Status](https://img.shields.io/github/actions/workflow/status/lspcontainers/dockerfiles/build-image.yml?branch=main)](https://github.com/lspcontainers/dockerfiles/actions)
[![License](https://img.shields.io/github/license/lspcontainers/dockerfiles)](LICENSE)

## 🌟 What is this?

This repository provides **production-ready Docker containers** for 25+ Language Server Protocol (LSP) servers, enabling you to run language servers in isolated, reproducible environments. Perfect for:

- **Consistent development environments** across teams
- **CI/CD pipelines** with reliable tooling
- **Remote development** with containerized language servers
- **Editor/IDE integration** without local language server installation

## 🛠️ Supported Language Servers

| Language | Server | Container | Latest Version |
|----------|--------|-----------|----------------|
| **Bash** | bash-language-server | `lspcontainers/bash-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/bash-language-server?sort=semver) |
| **C/C++** | clangd | `lspcontainers/clangd-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/clangd-language-server?sort=semver) |
| **C#** | omnisharp | `lspcontainers/omnisharp-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/omnisharp-language-server?sort=semver) |
| **Docker** | dockerfile-ls | `lspcontainers/docker-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/docker-language-server?sort=semver) |
| **Go** | gopls | `lspcontainers/gopls` | ![Version](https://img.shields.io/docker/v/lspcontainers/gopls?sort=semver) |
| **HTML** | html-languageserver | `lspcontainers/html-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/html-language-server?sort=semver) |
| **JavaScript/TypeScript** | typescript-language-server | `lspcontainers/typescript-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/typescript-language-server?sort=semver) |
| **JSON** | vscode-json-languageserver | `lspcontainers/json-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/json-language-server?sort=semver) |
| **Lua** | lua-language-server | `lspcontainers/lua-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/lua-language-server?sort=semver) |
| **PHP** | intelephense | `lspcontainers/php-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/php-language-server?sort=semver) |
| **Python** | pylsp/pyright | `lspcontainers/python-lsp-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/python-lsp-server?sort=semver) |
| **Ruby** | solargraph | `lspcontainers/ruby-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/ruby-language-server?sort=semver) |
| **Rust** | rust-analyzer | `lspcontainers/rust-analyzer` | ![Version](https://img.shields.io/docker/v/lspcontainers/rust-analyzer?sort=semver) |
| **YAML** | yaml-language-server | `lspcontainers/yaml-language-server` | ![Version](https://img.shields.io/docker/v/lspcontainers/yaml-language-server?sort=semver) |
| *And 10+ more...* | | | |

## 🚀 Quick Start

### Using Pre-built Images

```bash
# Pull and run a language server
docker run -it lspcontainers/typescript-language-server

# Use with your editor (example with neovim)
docker run -v $(pwd):/workspace lspcontainers/gopls
```

### Building Locally

```bash
# Clone the repository
git clone https://github.com/lspcontainers/dockerfiles.git
cd dockerfiles

# Build a specific server
docker-compose build typescript-language-server

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

### **With VS Code**
```json
{
  "languageserver": {
    "golang": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "-v", "${workspaceFolder}:/workspace", "lspcontainers/gopls"],
      "rootPatterns": ["go.mod", ".git/"],
      "filetypes": ["go"]
    }
  }
}
```

### **With Neovim**
```lua
require('lspconfig').gopls.setup {
  cmd = {"docker", "run", "-i", "--rm", "-v", vim.fn.getcwd() .. ":/workspace", "lspcontainers/gopls"}
}
```

### **CI/CD Integration**
```yaml
# GitHub Actions example
- name: Check Go code with gopls
  run: |
    docker run --rm -v ${{ github.workspace }}:/workspace \
      lspcontainers/gopls check /workspace
```

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
