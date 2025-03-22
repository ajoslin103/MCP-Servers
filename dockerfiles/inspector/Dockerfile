FROM node:18

# Install MCP Inspector
RUN npm install -g @modelcontextprotocol/inspector

# Expose the port
EXPOSE 3000

# Run the inspector
CMD ["mcp-inspector", "--host", "0.0.0.0"]
