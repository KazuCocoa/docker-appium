FROM ubuntu:15.10
MAINTAINER KazuCocoa <fly.49.89.over@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# update apt-get
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y zip curl git openjdk-8-jdk libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Main Android SDK
RUN curl -L "http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz" | tar -zxv -C /usr/local
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_SDK /usr/local/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

ENV ANDROID_SDK_COMPONENTS platform-tools,build-tools-23.1.0
RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

# create appium user
# RUN useradd -m -s /bin/bash appium
# USER appium
# ENV HOME /home/appium
# RUN mkdir /opt/appium && chown -R appium:appium /opt/appium

# install appium
RUN npm install -g appium@1.4.16

# Run appium
EXPOSE 4723
CMD ["appium"]
# CMD ["node", "/opt/appium/node_modules/appium/bin/appium.js"]
