# Android development environment for ubuntu trusty (14.04).
# version 0.0.1

FROM ubuntu:14.04

MAINTAINER oren

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get -y install python-software-properties git
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  bzip2 \
  wget \
  ant \
  openjdk-7-jre \
  openjdk-7-jdk \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Make sure the package repository is up to date
# RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
# RUN apt-get update -qq && apt-get clean

# RUN apt-get install -y bzip2 wget && apt-get clean

# Install android sdk
RUN wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz && \
    tar -xvzf android-sdk_r23.0.2-linux.tgz && \
    mv android-sdk-linux /usr/local/android-sdk && \
    rm android-sdk_r23.0.2-linux.tgz

# Add android tools and platform tools to PATH
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Install latest android (19 / 4.4.2) tools and system image.
RUN echo "y" | android update sdk --no-ui --force --filter platform-tools,android-19,build-tools-20.0.0

#Install nodejs
RUN add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get update -qq && \
    apt-get install -y nodejs

# Append to $PATH variable.
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

# install cordova
RUN npm install -g cordova

# Clean
RUN apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  ~/.npm  /var/cache/apt/*  && \
    npm cache clear

VOLUME /workspace
WORKDIR /workspace
