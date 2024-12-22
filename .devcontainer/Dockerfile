FROM mcr.microsoft.com/devcontainers/javascript-node:20

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    python3 \
    gnupg \
    curl \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set up correct Node.js version
RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install 20.18.0 && nvm alias default 20.18.0"

# Enable corepack and set up Yarn
RUN su node -c "corepack enable && corepack prepare yarn@4.5.3 --activate"

# Install MongoDB tools
RUN curl -fsSL https://pgp.mongodb.com/server-6.0.asc | gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor \
    && echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org-tools \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install Deno
RUN curl -fsSL https://deno.land/x/install/install.sh | sh && \
    mv /root/.deno/bin/deno /usr/local/bin/

# Add MongoDB initialization script
COPY mongodb-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mongodb-init.sh

# Set working directory
WORKDIR /workspace
