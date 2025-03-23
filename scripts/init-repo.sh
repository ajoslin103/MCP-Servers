#!/bin/bash

# Set correct Node.js version
if command -v nvm &> /dev/null; then
  echo "Setting Node.js version..."
  nvm use
else
  echo "nvm not found. Please install nvm or manually set Node.js version."
  exit 1
fi

# Install required global packages
echo "Installing MCP Inspector globally..."
npm install -g @modelcontextprotocol/inspector

echo "Repository initialized successfully."
echo "- Run 'docker compose up -d' to start containerized servers"
echo "- Run './scripts/start-inspector.sh' to start the Inspector"
