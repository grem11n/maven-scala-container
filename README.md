# Docker container with Maven Java7 and Scala

![logo] (https://binfalse.de/assets/media/pics/2016/mvn-docker.jpg "Docker & Apache")

## Description

This could be useful if you don't want to install Maven locally

## Usage

1. Put this Dockerfile into your project directory

2. Build the image with, for example (you can call image as you want)

```docker build -t maven .```

3. Build your project with

```docker run -i -t -v /your/project/directory:/usr/src:rw maven mvn clean install -f /usr/src/pom.xml```

## Properties

- Java version: ```1.7.0_111```
- Scala version: ```2.11.4```
- sbt version: ```0.13.13```
- Maven version: ```3.3.9```

## Tests

Tested on macOS 10.12.1 (Sierra)