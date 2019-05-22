FROM ubuntu

LABEL maintainer="Massimo Filippi"

# Install OpenSSH Client
RUN apt-get update && apt-get install -y --no-install-recommends \
        openssh-client

# Install Chrome for Ubuntu
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
#     sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' &&\
#     apt-get update && \
#     apt-get install -y google-chrome-stable

# Install Node & NPM
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get update && apt-get install -y --no-install-recommends \
        nodejs

# Download latest Lighthouse from npm.
# cache bust so we always get the latest version of LH when building the image.
ARG CACHEBUST=1
RUN npm i lighthouse -g
