FROM mcr.microsoft.com/devcontainers/javascript-node:20

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    python3 \
    mongodb-clients \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set up correct Node.js version
RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install 20.18.0 && nvm alias default 20.18.0"

# Enable corepack and set up Yarn
RUN su node -c "corepack enable && corepack prepare yarn@4.5.3 --activate"

# Add MongoDB initialization script
COPY mongodb-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mongodb-init.sh

# Set working directory
WORKDIR /workspace
