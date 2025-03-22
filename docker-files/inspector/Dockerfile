FROM node:18

WORKDIR /app

# Install MCP Inspector
RUN npm install -g @modelcontextprotocol/inspector

# Create a simple entry script
RUN echo '#!/bin/sh\nCLIENT_PORT=5173 SERVER_PORT=3000 /usr/local/bin/npx @modelcontextprotocol/inspector' > /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

# Expose both ports used by the inspector
EXPOSE 5173 3000

CMD ["/app/entrypoint.sh"]
