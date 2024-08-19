# Use the official Python 3.9 image as a base
FROM python:3.9-slim

# Add packages
RUN apt-get update && apt-get install -y adduser git nano

# Create a new user
RUN useradd -m -s /bin/bash user1

# Set the default user to use when running commands
USER user1

# Set the working directory to the user home directory
WORKDIR /home/user1

# Clone the repository
RUN git clone https://github.com/OliveiraEdu/OpenScience.git OpenScience


# Set up a Python virtual environment for user1
WORKDIR /home/user1/OpenScience
# RUN chown -R user1:user1 /app
# RUN python3 -m venv venv


# Activate the virtual environment
# RUN . /app/venv/bin/activate

# Install packages from requirements.txt
# COPY requirements.txt .
# RUN pip install jupyterlab
# RUN pip install --no-cache-dir -r requirements.txt


# Deactivate the virtual environment after installation
# RUN deactivate


# Set the IP address and port for Jupyter Lab
ENV JUPYTER_NOTEBOOK_PASSWORD=your_password_here
ENV JUPYTER_NOTEBOOK_PORT=8888
ENV JUPYTER_NOTEBOOK_IP=0.0.0.0

CMD ["/bin/bash"]
# Set the default command to run Jupyter Lab with remote access enabled
# CMD ["jupyter", "lab", "--ip=$JUPYTER_NOTEBOOK_IP", "--port=$JUPYTER_NOTEBOOK_PORT", "--password=$JUPYTER_NOTEBOOK_PASSWORD"]