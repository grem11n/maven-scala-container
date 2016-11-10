FROM openjdk:7-jdk

# Generic
RUN apt-get update
RUN apt-get -y install curl tar bash apt-transport-https
RUN apt-get -y install libfontconfig
# Scala
RUN wget http://www.scala-lang.org/files/archive/scala-2.9.1-1.tgz
RUN tar zxf scala-2.9.1-1.tgz
RUN mv scala-2.9.1-1 /usr/share
RUN ln -s /usr/share/scala-2.9.1-1 /usr/share/scala
RUN ln -s /usr/share/scala/bin/scala /usr/bin/scala
RUN ln -s /usr/share/scala/bin/scalac /usr/bin/scalac
RUN ln -s /usr/share/scala/bin/fsc /usr/bin/fsc
RUN ln -s /usr/share/scala/bin/scaladoc /usr/bin/scaladoc
RUN ln -s /usr/share/scala/bin/scalap /usr/bin/scalap
# sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update
RUN apt-get install sbt

# NPM
RUN apt-get -y install npm
# Maven
ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

VOLUME "$USER_HOME_DIR/.m2"

CMD ["mvn"]
