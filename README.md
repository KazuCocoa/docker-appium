# docker-appium

Ubuntu 14.04 base.
Appium and Android build environment with Docker.

Docker Hub is https://registry.hub.docker.com/u/kazucocoa/docker_android_testpack/

## Run Appium
```
$ make dockerappium
```

## Build
```
$ make dockerdebug
```

Run appium in background

```
$ docker run -d -i -t docker_appium
```

> -d flag which tells Docker to run the container in the background

## Network
If you would like to set ip-addresses, please specify with docker options.
