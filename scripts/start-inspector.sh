#!/bin/bash

# PID file for tracking the process
PID_FILE="./docker-data/inspector/inspector.pid"

# Create directory if it doesn't exist
mkdir -p "./docker-data/inspector"

# Kill any existing inspector process
if [ -f "$PID_FILE" ]; then
  OLD_PID=$(cat "$PID_FILE")
  if ps -p $OLD_PID > /dev/null; then
    echo "Stopping existing MCP Inspector (PID: $OLD_PID)"
    kill $OLD_PID
  fi
  rm "$PID_FILE"
fi

# Start the MCP Inspector in the background
echo "Starting MCP Inspector in background..."
npx @modelcontextprotocol/inspector > ./docker-data/inspector/inspector.log 2>&1 &

# Save the process ID
echo $! > "$PID_FILE"
echo "MCP Inspector running with PID: $(cat $PID_FILE)"
echo "MCP Inspector is available at: http://localhost:5173"
echo "View logs with: tail -f ./docker-data/inspector/inspector.log"
echo "Stop with: ./scripts/stop-inspector.sh"
