# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Add packages
RUN apt-get update && apt-get install -y adduser git nano

# Add a user
RUN adduser --gecos '' user1
RUN usermod -aG sudo user1

# # Change to the root directory
# USER root

# # Set the ownership of the directory to user1
# RUN chown -R user1:user1 /app

# Change to the user's home directory
USER user1


# Set the working directory to the user home directory
WORKDIR /home/user1

# Clone the repository
RUN git clone https://github.com/OliveiraEdu/OpenScience.git OpenScience

# Change into the cloned directory
WORKDIR /home/user1/OpenScience

# Create a virtual environment and install Jupyter Lab
# ENV VIRTUAL_ENV=/home/user1/OpenScience/venv
# RUN python -m venv $VIRTUAL_ENV
# RUN . $VIRTUAL_ENV/bin/activate
# RUN pip install jupyterlab

# # Install other dependencies from requirements.txt
# COPY requirements.txt .

# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

# # RUN deactivate

# # # # Setup the virtual environment kernel for Jupyter Notebooks
# # # RUN ipython kernel install --user --name=venv
# # # RUN python -m bash_kernel.install

EXPOSE 8888
# # CMD ["jupyter", "cdlab", "--port=8888"]
CMD ["/bin/bash"]