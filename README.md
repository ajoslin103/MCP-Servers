# MCP Servers

This project sets up Model Context Protocol (MCP) servers using Docker Compose.

## Included Servers

- **Git** - Read, search, and manipulate Git repositories
- **Filesystem** - Secure file operations with configurable access controls
- **PostgreSQL** - Database access with schema inspection
- **Memory** - Knowledge graph-based persistent memory system
- **Inspector** - GUI tool for managing and debugging MCP servers (run locally with npx)

## Setup

1. Start the containerized servers:
```bash
docker compose up -d
```

2. Start the MCP Inspector locally:
```bash
./scripts/start-inspector.sh
```

3. Stop the servers:
```bash
docker compose down
```

## Configuration

Each server can be configured through environment variables in the docker-compose.yml file.

## Accessing the Inspector

The MCP Inspector will be available at http://localhost:5173 after starting it with the script.
