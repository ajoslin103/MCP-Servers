#!/bin/bash

# Ensure we're using the correct Node.js version
if command -v nvm &> /dev/null; then
  nvm use
fi

# Start the MCP Inspector
npx @modelcontextprotocol/inspector
