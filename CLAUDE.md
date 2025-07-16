# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains Dockerfiles for Language Server Protocol (LSP) servers used with `lspcontainers`. Each language server is containerized to provide consistent development environments across different platforms.

## Build Commands

### Building Docker Images
- `docker-compose build <server>` - Build a specific server (e.g., `docker-compose build tsserver`)
- `docker-compose build` - Build all servers
- `docker-compose build --parallel` - Build all servers in parallel (faster)

### Available Servers
The docker-compose.yaml defines 24 language servers:
- `bashls` - Bash Language Server
- `clangd` - C/C++ Language Server
- `denols` - Deno Language Server
- `dockerls` - Docker Language Server
- `eslintls` - ESLint Language Server
- `gopls` - Go Language Server
- `graphql-lsp` - GraphQL Language Service
- `html` - HTML Language Server
- `intelephense` - PHP Language Server
- `jsonls` - JSON Language Server
- `lemminx` - XML Language Server
- `omnisharp` - C# Language Server
- `powershell_es` - PowerShell Language Server
- `prisma` - Prisma Language Server
- `pylsp` - Python LSP Server
- `pyright` - Python Language Server
- `rust_analyzer` - Rust Language Server
- `solargraph` - Ruby Language Server
- `sumneko_lua` - Lua Language Server
- `svelteserver` - Svelte Language Server
- `tailwindcss` - Tailwind CSS Language Server
- `terraformls` - Terraform Language Server
- `tsserver` - TypeScript Language Server
- `volar` - Vue Language Server (Volar)
- `vuels` - Vue Language Server (legacy)
- `yamlls` - YAML Language Server

### Linting
The CI workflow uses hadolint to lint Dockerfiles:
```bash
docker run --rm -v $(pwd):/code -w /code hadolint/hadolint:latest-alpine servers/<server>/Dockerfile
```

## Architecture

### Repository Structure
```
servers/
├── <server-name>/
│   ├── Dockerfile        # Container definition
│   └── docker_entrypoint.sh  # Optional entrypoint script (e.g., gopls)
├── docker-compose.yaml   # Service definitions
└── .github/workflows/    # CI/CD automation
```

### Container Patterns
1. **Alpine-based**: All containers use Alpine Linux as the base image for minimal size
2. **Package managers**: Different servers use appropriate package managers:
   - Node.js servers: `npm` or `yarn`
   - Go servers: `go install`
   - Python servers: `pip`
   - Ruby servers: `gem`
3. **User management**: Some containers (like gopls) create dedicated users with sudo access
4. **Entrypoint scripts**: Complex setups use shell scripts for runtime configuration

### Special Cases
- **gopls**: Uses a custom entrypoint script to handle user/group ID mapping
- **volar**: Pinned to specific version (1.8.11) in environment variable
- **tsserver**: Includes Vue TypeScript plugin for Vue.js support

### CI/CD Pipeline
The GitHub Actions workflow:
1. Runs hadolint on each Dockerfile
2. Builds images using Docker Buildx
3. Pushes to Docker Hub on main branch
4. Runs daily builds via cron schedule
5. Uses matrix strategy to build all servers in parallel

### Container Tagging
Each container has two tags:
- `latest`: Points to the most recent build
- Pinned version: Latest version of the language server

## Development Guidelines

When adding new language servers:
1. Create a new directory under `servers/`
2. Write a Dockerfile following Alpine Linux pattern
3. Add the service to `docker-compose.yaml`
4. Update the CI workflow matrix in `.github/workflows/build-image.yml`
5. Test locally with `docker-compose build <server>`
6. Verify with hadolint: `docker run --rm -v $(pwd):/code -w /code hadolint/hadolint:latest-alpine servers/<server>/Dockerfile`