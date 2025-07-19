# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains Dockerfiles for 25+ Language Server Protocol (LSP) servers, designed to work with the [lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim) Neovim plugin. Each LSP server is packaged as a Docker container with pinned versions for reproducible builds.

## Common Development Commands

### Building Containers

```bash
# Build a specific language server container
docker-compose build <server-name>

# Examples:
docker-compose build gopls
docker-compose build tsserver
docker-compose build pylsp

# Build all containers
docker-compose build

# Build all containers in parallel (faster)
docker-compose build --parallel
```

### Container Testing

```bash
# Run hadolint linting on a specific Dockerfile
docker container run \
  --entrypoint hadolint \
  --rm \
  --volume $(pwd):/code \
  --workdir /code \
  hadolint/hadolint:latest-alpine \
  servers/<server-name>/Dockerfile
```

### Version Management

To update a language server version:
1. Edit the `ARG VERSION=X.Y.Z` line in `servers/<server-name>/Dockerfile`
2. Update the `LABEL version="${VERSION}"` if needed
3. Test the build locally: `docker-compose build <server-name>`

## Architecture

### Directory Structure

- `servers/` - Contains subdirectories for each LSP server
  - `servers/<server-name>/Dockerfile` - Container definition for each server
  - `servers/gopls/docker_entrypoint.sh` - Custom entrypoint for Go language server
- `docker-compose.yaml` - Defines all services and their Docker Hub image names
- `.github/workflows/build-and-push.yml` - CI/CD pipeline for building and publishing containers

### Container Design Patterns

**Standard Pattern:**
```dockerfile
FROM alpine:3.22.1
ARG VERSION=X.Y.Z
LABEL version="${VERSION}"
RUN apk add --no-cache <packages>
CMD [ "language-server", "--stdio" ]
```

**Multi-stage Build Pattern (for complex dependencies):**
```dockerfile
FROM alpine:3.22.1 as build
# Build dependencies
FROM alpine:3.22.1
# Runtime dependencies only
COPY --from=build /build-artifacts .
```

**Patterns with Additional Tools:**
- **Go servers**: Include additional Go development tools (gopkgs, go-outline, gotests, etc.)
- **Bash servers**: Include shellcheck for linting
- **Python servers**: Use virtual environments for isolation

### Version Extraction and Tagging

The CI pipeline automatically:
1. Extracts version from `ARG VERSION=` in Dockerfiles
2. Tags containers with both `latest` and specific version (e.g., `v1.2.3`)
3. Builds multi-architecture images (amd64, arm64) except for PowerShell ES (amd64 only)

### Security and Best Practices

- Alpine Linux base images for minimal attack surface
- Pinned package versions for reproducibility
- Non-root users where applicable (e.g., gopls)
- Multi-stage builds to reduce final image size
- hadolint linting enforced in CI

## Container Registry

All containers are published to Docker Hub under the `lspcontainers` organization with specific naming conventions defined in the CI matrix.