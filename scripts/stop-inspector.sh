#!/bin/bash

# PID file for tracking the process
PID_FILE="./docker-data/inspector/inspector.pid"

# Stop the inspector if running
if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if ps -p $PID > /dev/null; then
    echo "Stopping MCP Inspector (PID: $PID)"
    kill $PID
  else
    echo "No running MCP Inspector found with PID: $PID"
  fi
  rm "$PID_FILE"
else
  echo "No MCP Inspector PID file found."
fi
