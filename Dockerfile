### IMPORTANT: this image should be used for DEVELOPMENT ONLY

# Use an official Miniconda image as the base image
FROM continuumio/miniconda3:latest

# Set the working directory in the container
# WORKDIR /workspace

# Optionally, prevent Python from writing pyc files to disc (optional)
ENV PYTHONDONTWRITEBYTECODE 1

# Optionally, prevent Python from buffering stdout and stderr (optional)
ENV PYTHONUNBUFFERED 1

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Use Conda to create a Python environment and install dependencies
RUN conda create --name devenv --file requirements.txt
RUN echo "source activate devenv" > ~/.bashrc
ENV PATH /opt/conda/envs/devenv/bin:$PATH

# Install any dependencies in the requirements.txt

# Keep the container running and attach VS Code
CMD ["sleep", "infinity"]

