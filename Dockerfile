FROM ubuntu:latest

# Install essential packages
RUN apt-get update && \
    apt-get install -y openssh-server curl git

# Set up SSH server
RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install Node.js and other dependencies
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get -y install nodejs && \
    npm install -g pnpm && \
    mkdir /home/Git && \
    cd /home/Git && \
    git clone https://github.com/OliveiraEdu/iroha2_javascript/ && \
    cd /home/Git/iroha2_javascript && \
    npm init --yes && \
    echo "@iroha2:registry=https://nexus.iroha.tech/repository/npm-group/" > .npmrc && \
    npm i @iroha2/client@5.0.0 && \
    npm i @iroha2/data-model@5.0.0 && \
    npm i @iroha2/crypto-core && \
    npm i @iroha2/crypto-target-node && \
    npm i @iroha2/crypto-target-web && \
    npm i @iroha2/crypto-target-bundler && \
    npm i hada && \
    npm i tsx -g && \
    npm i node-fetch

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
