# Use the official Python 3.9 image as a base
FROM python:3.9-slim

# Add packages
RUN apt-get update && apt-get install -y adduser git nano

# Create a new user
RUN useradd -m -s /bin/bash user1

# Set the default user to use when running commands
USER user1


# Set up a Python virtual environment for user1
WORKDIR /app
RUN python3 -m venv venv


# Activate the virtual environment
RUN . /app/venv/bin/activate

# Install packages from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Deactivate the virtual environment after installation
# RUN deactivate

RUN . /app/venv/bin/activate

# Set the default command to run Jupyter Lab
# CMD ["jupyter", "lab"]
CMD ["/bin/bash"]