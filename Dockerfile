# largely inspired by: https://tsaprailis.com/2017/10/10/Docker-for-data-science-part-1-building-jupyter-container/#volumes

# Use the latest ubuntu image as base for the new image
# ubuntu is the image name and latest is a tag that
# references a particular version of the image.
# In this case latest is always the latest LTS image
# at the time of writing this, it's 16.04.
FROM ubuntu:latest

# Run a system update to get it up to speed
# Then install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
  python3-pip

# Install jupyter and friends
RUN pip3 install pip --upgrade \
  jupyter \
  numpy \
  pandas \
  sklearn \
  scipy \
  seaborn \
  matplotlib  \
  nltk

# Create a new system user
RUN useradd -ms /bin/bash jupyter

# Change to this new user
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter

# Start the jupyter notebook
# ENTRYPOINT ["jupyter", "notebook", "--ip=*"]
