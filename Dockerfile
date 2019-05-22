FROM ubuntu

LABEL maintainer="Massimo Filippi"

# Install basic stuff
RUN apt-get update --fix-missing \
    && apt-get -y upgrade \
    && apt-get install -y \
        sudo \
        apt-utils \
        curl \
        wget \
        openssh-client \
        gnupg \
        unzip

# Install Chrome for Ubuntu
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' &&\
    apt-get update && \
    apt-get install -y google-chrome-stable

# Install Node, NPM & Google Lighthouse
# cache bust so we always get the latest version of LH when building the image.
ARG CACHEBUST=1
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm install -g lighthouse
