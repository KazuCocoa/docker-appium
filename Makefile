dockerenv:
	docker build -t docker_android_testpack ./

dockerdebug:
	docker run -i -w "/home/appium" -t docker_android_testpack /bin/bash -c 'git clone https://github.com/KazuCocoa/ScreenCapture.git && cd ScreenCapture && ./gradlew assembleDebug'

dockerappium:
	docker run -i -d --expose 4723 -t docker_android_testpack node /opt/appium/node_modules/appium/bin/appium.js

dockertest:
	docker run -i -w "/home/appium" -t docker_android_testpack /bin/bash -c 'git clone https://github.com/KazuCocoa/sampleRoboletricTests.git && cd sampleRoboletricTests && TERM=dumb ./gradlew -i test'
