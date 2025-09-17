# Use Node.js 18 slim (lightweight, stable LTS)
FROM node:18-slim

# Create app directory
WORKDIR /app

# Copy package manifests first (better caching)
COPY package*.json ./

# Install production dependencies
RUN npm install --production

# Copy app source
COPY . .

# Make sure app listens on Fly.io's dynamic port
ENV PORT=8080

# Expose port (must match fly.toml internal_port)
EXPOSE 8080

# Start server (adjust if your entrypoint is different)
CMD ["node", "index.js"]

