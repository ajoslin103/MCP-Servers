# MCP Servers

This project sets up Model Context Protocol (MCP) servers using Docker Compose.

## Included Servers

- **Git** - Read, search, and manipulate Git repositories
- **Filesystem** - Secure file operations with configurable access controls
- **PostgreSQL** - Database access with schema inspection
- **Memory** - Knowledge graph-based persistent memory system
- **Inspector** - GUI tool for managing and debugging MCP servers (run locally with npx)

## Setup

1. Initialize the repository:
```bash
./scripts/init-repo.sh
```
This will:
- Set the correct Node.js version using nvm
- Install MCP Inspector globally

2. Start the containerized servers:
```bash
docker compose up -d
```

3. Start the MCP Inspector locally:
```bash
./scripts/start-inspector.sh
```

4. Stop the MCP Inspector:
```bash
./scripts/stop-inspector.sh
```

5. Stop the containerized servers:
```bash
docker compose down
```

## Directory Structure

- `docker-data/` - Data directories for each MCP server
- `docker-files/` - Dockerfile resources
- `scripts/` - Utility scripts for managing services
  - `init-repo.sh` - Initialize the repository with correct Node.js and packages
  - `start-inspector.sh` - Start the MCP Inspector in background
  - `stop-inspector.sh` - Stop the MCP Inspector
  - templates:
  - `template-start-mcp-server.sh` - Template for creating start scripts for MCP servers
  - `template-stop-mcp-server.sh` - Template for creating stop scripts for MCP servers

## Configuration

Each server can be configured through environment variables in the docker-compose.yml file.

## Accessing the Inspector

The MCP Inspector will be available at http://localhost:5173 after starting it with the script.

## Logs

- Inspector logs are stored in `./docker-data/inspector/inspector.log`

## Adding New MCP Servers

To add a new MCP server that runs locally (non-dockerized):

1. Copy the template scripts:
```bash
cp scripts/template-start-mcp-server.sh scripts/start-newserver.sh
cp scripts/template-stop-mcp-server.sh scripts/stop-newserver.sh
chmod +x scripts/start-newserver.sh scripts/stop-newserver.sh
```

2. Edit both scripts to set:
- `SERVER_NAME` - Name of your server
- `NPX_COMMAND` - NPX command to run the server
- `PORT` - Port the server runs on

3. Make sure to install the server package globally or specify it in the NPX command.
