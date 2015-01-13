# docker-appium

Ubuntu 14.04 base.
Appium and Android build environment with Docker.


## Run
```
$ docker build -t docker_appium ./
```

## Run
```
$ docker run -i -t docker_appium /bin/bash
```


Run appium in background

```
$ docker run -d -i -t docker_appium
```

> -d flag which tells Docker to run the container in the background

## Network
If you would like to set ip-addresses, please specify with docker options.
