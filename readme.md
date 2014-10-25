# Docker container for cordova development

## setup
docker build -t cordova .

	# special permission for usb  
	# mount usb volume  
	# mount current folder
	docker run --rm -it --privileged -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/app -p 3000:3000 cordova /bin/bash

## push to public docker registry

  docker tag cordova oreng/cordova:1.0.0
	docker push oreng/cordova:1.0.0

## problems and solutions

**DNS issue**

uncomment `DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"` in /etc/default/docker and sudo service docker restart

**Android build failing with build.xml:479: SDK does not have any Build Tools installed**

android update sdk -u

**Unable to run 'adb': Cannot run program "/usr/local/android-sdk/platform-tools/adb": error=2, No such file or directory**

	sudo apt-get install lib32z1 lib32z1-dev  
	sudo apt-get install lib32stdc++6

**cordova build =>  [Error: Failed to run "android". Make sure you have the latest Android SDK installed, and that the "android" command (inside the tools/ folder) is added to your PATH.]**

  ?

## start a cordova project

	cordova create Hello com.example.hello "Hello"
	cd Hello
	cordova platform add android
	cordova build
	cordova run android     # to run on real device (connnected with usb)

## misc commands

	alias cdv='docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/app -p 3000:3000 cordova'
	cdv adb devices # List usb devices
	cdv cordova build android # Build app
	cdv cordova run android # Run app on device
	cdv npm update # Update my app dependecies

## Resources

* http://stackoverflow.com/questions/25210604/setting-up-a-development-environment-with-docker
* https://github.com/nicopace/ionic-cordova-android-vagrant-docker/blob/master/Dockerfile#L50
