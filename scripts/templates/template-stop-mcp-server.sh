#!/bin/bash
# Template for creating stop scripts for any MCP server
# To use:
# 1. Copy this file to scripts/stop-<server-name>.sh
# 2. Replace SERVER_NAME

# Server configuration
SERVER_NAME="server-name"

# PID file for tracking the process
PID_FILE="./docker-data/$SERVER_NAME/$SERVER_NAME.pid"

# Stop the server if running
if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if ps -p $PID > /dev/null; then
    echo "Stopping MCP $SERVER_NAME (PID: $PID)"
    kill $PID
  else
    echo "No running MCP $SERVER_NAME found with PID: $PID"
  fi
  rm "$PID_FILE"
else
  echo "No MCP $SERVER_NAME PID file found."
fi
