# Use an official Python image as the base
FROM python:3.9-slim

# Add packages
RUN apt-get update && apt-get install -y adduser git nano

# Create a new user
RUN useradd -m -s /bin/bash user1

# Set the default user to use when running commands
USER user1

# Set the working directory to the user home directory
WORKDIR /home/user1

# Clone your GitHub repository
RUN git clone https://github.com/OliveiraEdu/OpenScience.git OpenScience

# Change into the repository directory
WORKDIR /home/user1/OpenScience

# Make the scripts executable
RUN chmod +x key_setup.sh
RUN chmod +x git_setup.sh


#-
# Set the default command to start JupyterLab
ENV PATH=$PATH:/home/user1/.local/lib/python3.9/site-packages
ENV PATH=$PATH:/home/user1/.local/bin

# Install packages from requirements.txt in the repository
RUN pip install -r requirements.txt
# RUN pip install jupyterlab

CMD ["jupyter", "lab", "--ip=0.0.0.0"]
#-


# Set the default command to start JupyterLab
# CMD ["jupyter", "lab", "--ip=0.0.0.0"]
# CMD ["/bin/bash"]

# Copy the public key out of the container (during RUN command)
RUN echo "Generating SSH key..." && \
    ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub > id_rsa_pub