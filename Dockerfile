# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Download stew binary manager from apk and remove the apk
RUN curl -L https://github.com/marwanhawari/stew/releases/download/v0.4.0/stew_0.4.0_linux_amd64.apk && \
    apk add --allow-untrusted stew_0.4.0_linux_amd64.apk && \
    rm stew_0.4.0_linux_amd64.apk

RUN mkdir -p $HOME/.config/stew && \
    mkdir -p $HOME/.local/share/stew && \
    cp stew.config.json $HOME/.config/stew/ && \
    cp Stewfile.lock.json $HOME && \
    stew install $HOME/Stewfile.lock.json && \
    rm -rf $HOME/.local/share/stew/pkg

# Install other Alpine dependencies
RUN apk add --update --no-cache openssh-client ca-certificates bash

# Set the default command to run when the container starts
CMD ["bash"]
