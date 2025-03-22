# MCP Servers

This project sets up Model Context Protocol (MCP) servers using Docker Compose.

## Included Servers

- **Git** - Read, search, and manipulate Git repositories
- **Filesystem** - Secure file operations with configurable access controls
- **PostgreSQL** - Database access with schema inspection
- **Memory** - Knowledge graph-based persistent memory system
- **Inspector** - GUI tool for managing and debugging MCP servers

## Setup

1. Create Dockerfile for Inspector:
```bash
# In docker-files/inspector/Dockerfile
FROM node:18
RUN npm install -g @modelcontextprotocol/inspector
EXPOSE 3000
CMD ["mcp-inspector", "--host", "0.0.0.0"]
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
