# MCP Servers

This project sets up Model Context Protocol (MCP) servers using Docker Compose.

## Included Servers

- **Git** - Read, search, and manipulate Git repositories
- **Filesystem** - Secure file operations with configurable access controls
- **PostgreSQL** - Database access with schema inspection
- **Memory** - Knowledge graph-based persistent memory system
- **Inspector** - GUI tool for managing and debugging MCP servers

## Setup

1. Create required data directories:
```bash
mkdir -p data/git data/filesystem data/memory data/postgres data/inspector
```

2. Start the servers:
```bash
docker-compose up -d
```

3. Stop the servers:
```bash
docker-compose down
```

## Configuration

Each server can be configured through environment variables in the docker-compose.yml file.

## Accessing the Inspector

The MCP Inspector will be available at http://localhost:3000 after the containers are started.
