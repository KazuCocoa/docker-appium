dockerenv:
	docker build -t appium_android ./

dockerdebug:
	docker run -i -w "/home/appium" -t appium_android /bin/bash -c 'git clone https://github.com/KazuCocoa/ScreenCapture.git && cd ScreenCapture && ./gradlew assembleDebug'

dockerappium:
	docker run -i -d --expose 4723 -t appium_android node /opt/appium/node_modules/appium/bin/appium.js
