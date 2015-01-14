FROM ubuntu:14.04
MAINTAINER Kazuaki MATSUO

# update apt-get
RUN apt-get update
RUN apt-get install -y wget zip curl && rm -rf /var/lib/apt/lists/*

# install Android SDKs
RUN apt-get update
RUN apt-get install -y git openjdk-7-jdk lib32z1 lib32ncurses5 lib32bz2-1.0 g++-multilib bison gperf libxml2-utils
#&& rm -rf /var/lib/apt/lists/*

# Main Android SDK
RUN wget -qO- "http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz" | tar -zxv -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --no-ui --all \
    --filter tools,platform-tools,build-tools-21.1.2,android-16,android-17,android-18,android-19,android-20,android-21,extra-android-support,extra-google-google_play_services,extra-google-m2repository,extra-android-m2repository,extra-google-gcm,extra-google-analytics_sdk_v2,extra-google-admob_ads_sdk,extra-intel-Hardware_Accelerated_Execution_Manager,sys-img-x86-android-19,sys-img-x86-android-20,sys-img-x86-android-21


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
