# Docker container for Cordova development

* [Setup](#setup)
* [New Project](#new-project)
* [Miscellaneous](#Miscellaneous)

## Setup

    git clone git@github.com:oren/docker-cordova.git
    cd docker-cordova
    docker build -t cordova .
    echo "alias cdv='docker run --rm -i -v `pwd`:/workspace -w /workspace --privileged -v /dev/bus/usb:/dev/bus/usb cordova'" >> ~/.bash_aliases
    open new terminal

The last command lets you use `cdv` for running any command inside the cordova container.

## New Project

    cdv cordova create hello com.example.hello HelloWorld
    cd hello
    cdv cordova platform add android
    cdv cordova build
    connect your android with usb
    cdv adb devices # List usb devices. make sure you see your phone.
    cdv cordova run android

## Miscellaneous

I keep all my dockerfiles in a folder:

    dockerfiles/
    ├── cordova
    │   ├── Dockerfile
    │   └── readme
    ├── go
    │   ├── Dockerfile
    │   └── readme
    ├── nginx
    │   ├── Dockerfile
    │   └── readme
    ├── node
        ├── Dockerfile
        └── readme

The readme has the build command. For emample - `docker build -t cordova .`. I just run it once and add an alias to my .bash_profile

