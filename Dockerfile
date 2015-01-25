# Cordova tools for ubuntu precise (12.04 LTS).
# # version 0.0.1
FROM ahazem/android:v0.7.6

MAINTAINER peernohell <peernohell@gmail.com>

# add nodejs to install cordova (code from https://index.docker.io/u/dockerfile/nodejs/)
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Append to $PATH variable.
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile


# # install cordova
RUN npm install -g cordova

VOLUME /workspace
WORKDIR /workspace
