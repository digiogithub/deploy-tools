# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Install Alpine dependencies
RUN apk add --update --no-cache openssh-client ca-certificates bash curl

# Download stew binary manager from apk and remove the apk
RUN curl -L https://github.com/marwanhawari/stew/releases/download/v0.4.0/stew_0.4.0_linux_amd64.apk -o stew_0.4.0_linux_amd64.apk && \
    apk add --allow-untrusted stew_0.4.0_linux_amd64.apk && \
    rm stew_0.4.0_linux_amd64.apk

COPY stew.config.json Stewfile.lock.json /app/

RUN mkdir -p $HOME/.config/stew && \
    mkdir -p $HOME/.local/share/stew && \
    mv stew.config.json $HOME/.config/stew/ && \
    mv Stewfile.lock.json $HOME/ && \
    stew install $HOME/Stewfile.lock.json && \
    rm -rf $HOME/.local/share/stew/pkg

# Set the default command to run when the container starts
CMD ["bash"]
