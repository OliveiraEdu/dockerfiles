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
    mkdir /home/Git && \
    cd /home/Git && \
    git clone https://github.com/OliveiraEdu/iroha2_javascript/ && \
    cd /home/Git/iroha2_javascript && \
    echo "@iroha2:registry=https://nexus.iroha.tech/repository/npm-group/" > .npmrc && \
    npm init --yes && \
    git pull && \
    npm install --save-dev typescript && \
    npx tsc --init && \
    npm install --save-dev tsx && \
    npm i hada
    
# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
