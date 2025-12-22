
# Base image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

#install dependencies
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Copy files from host to container
COPY scripts/ ./scripts/

# Make script executable
RUN chmod +x ./scripts/fetch_crypto.sh

# Default command when container starts
CMD ["bash", "./scripts/fetch_crypto.sh"]