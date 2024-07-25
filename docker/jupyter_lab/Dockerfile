FROM quay.io/jupyter/minimal-notebook:latest


USER ${NB_UID}

WORKDIR "${HOME}"


# Clone the repository
RUN git clone https://github.com/OliveiraEdu/OpenScience.git OpenScience

WORKDIR OpenScience

RUN conda create --name venv && (source activate venv)

# Install other dependencies from requirements.txt
COPY requirements.txt .

RUN conda env update --file requirements.txt


# Setup the virtual environment kernel for Jupyter Notebooks
RUN conda install -c conda-forge ipykernel bash_kernel

# Add the Jupyter Lab executable to the PATH environment variable
ENV PATH=$PATH:/usr/local/bin

EXPOSE 8888
CMD ["jupyter", "lab", "--port=8888"]