FROM ubuntu:latest

# Install essential packages
RUN apt-get update && \
    apt-get install -y openssh-server curl git

# Set up SSH server
RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# Change to the '/home' directory
WORKDIR /home

# Create a directory named 'lab'
RUN mkdir /home/lab

# Change to the 'lab' directory
WORKDIR /home/lab

# Initialize a git repository
RUN git init

# Set up npm registry in .npmrc
RUN echo "@iroha2:registry=https://nexus.iroha.tech/repository/npm-group/" > .npmrc

# Install Node.js 20.x, Node.js, and pnpm
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get -y install nodejs && \
    npm install -g pnpm

# Initialize a pnpm project
RUN pnpm init

# Add all files to the git repository
RUN git add .

# Install TypeScript globally
RUN pnpm i typescript

# Initialize a TypeScript configuration
RUN npx tsc --init

# Install 'hada' package
RUN pnpm i hada

# Install 'tsx' globally
RUN pnpm i tsx

# Install 'tsx' locally
RUN pnpm i tsx

# Install 'node-fetch' using pnpm
RUN pnpm i node-fetch

# Install 'undici' using pnpm
RUN pnpm i undici

# Install specific versions of '@iroha2' packages
RUN pnpm i @iroha2/client@5.0.0 && \
    pnpm i @iroha2/data-model@5.0.0 && \
    pnpm i @iroha2/crypto-core && \
    pnpm i @iroha2/crypto-target-node && \
    pnpm i @iroha2/crypto-target-web && \
    pnpm i @iroha2/crypto-target-bundler

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
