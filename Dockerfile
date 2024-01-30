FROM ubuntu:latest

# Install essential packages
RUN apt-get update && \
    apt-get install -y openssh-server curl git
# Install Node.js 20.x, Node.js, and pnpm
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get -y install nodejs && \
    npm install -g pnpm
