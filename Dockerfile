# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy all binaries from the local ./bin/ directory to /usr/local/bin
# /usr/local/bin is typically included in the PATH
COPY ./bin/* /usr/local/bin/

# Ensure the binaries have execute permissions
RUN chmod +x /usr/local/bin/*

# Install other Alpine dependencies
RUN apk add --update --no-cache openssh-client ca-certificates bash

# Set the default command to run when the container starts
CMD ["bash"]
