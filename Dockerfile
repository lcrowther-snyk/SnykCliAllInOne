FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    maven \
    nodejs \
    npm \
    golang-go \
    && rm -rf /var/lib/apt/lists/*

# Install Snyk CLI
RUN npm install -g snyk

snyk auth $SNYK_TOKEN

# Set a working directory
WORKDIR /app

# This will be the default command to execute when running the container
CMD [ "snyk", "test" ]
