FROM ubuntu:14.04
MAINTAINER Kazuaki MATSUO

# update apt-get
RUN apt-get update
RUN apt-get install -y wget


# install Android SDKs
RUN apt-get install -y git openjdk-7-jre-headless lib32z1 lib32ncurses5 lib32bz2-1.0 g++-multilib

# Main Android SDK
RUN wget -qO- "http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz" | tar -zxv -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --no-ui --all --filter platform-tools,android-21,build-tools-21.1.2,extra-android-support

# Environments
ENV ANDROID_HOME /opt/android-sdk-linux
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install nodejs
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

# create appium user
RUN mkdir /opt/appium
RUN useradd -m -s /bin/bash appium
RUN chown -R appium:appium /opt/appium

USER appium
ENV HOME /home/appium

# install appium
RUN cd /opt/appium && npm install appium

# Run appium
#EXPOSE 4723
#CMD ["node", "/opt/appium/node_modules/appium/bin/appium.js"]
