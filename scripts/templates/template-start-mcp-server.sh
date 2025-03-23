#!/bin/bash
# Template for creating start scripts for any MCP server
# To use:
# 1. Copy this file to scripts/start-<server-name>.sh
# 2. Replace SERVER_NAME, NPX_COMMAND, and PORT

# Server configuration
SERVER_NAME="server-name"
NPX_COMMAND="@modelcontextprotocol/example-server"
PORT="3000"

# PID file for tracking the process
PID_FILE="./docker-data/$SERVER_NAME/$SERVER_NAME.pid"

# Create directory if it doesn't exist
mkdir -p "./docker-data/$SERVER_NAME"

# Kill any existing server process
if [ -f "$PID_FILE" ]; then
  OLD_PID=$(cat "$PID_FILE")
  if ps -p $OLD_PID > /dev/null; then
    echo "Stopping existing MCP $SERVER_NAME (PID: $OLD_PID)"
    kill $OLD_PID
  fi
  rm "$PID_FILE"
fi

# Start the MCP server in the background
echo "Starting MCP $SERVER_NAME in background..."
npx $NPX_COMMAND > ./docker-data/$SERVER_NAME/$SERVER_NAME.log 2>&1 &

# Save the process ID
echo $! > "$PID_FILE"
echo "MCP $SERVER_NAME running with PID: $(cat $PID_FILE)"
echo "MCP $SERVER_NAME is available at: http://localhost:$PORT"
echo "View logs with: tail -f ./docker-data/$SERVER_NAME/$SERVER_NAME.log"
echo "Stop with: ./scripts/stop-$SERVER_NAME.sh"
