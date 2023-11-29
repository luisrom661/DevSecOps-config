#!/bin/bash
wget http://${ec2_instance}:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ who-am-i 
vi creds
    admin:api-key
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin adoptopenjdk
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin sonar
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin nodejs
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin dependency-check-jenkins-plugin
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin docker-plugin
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin docker-commons
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin docker-workflow
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin docker-java-api
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin docker-build-step
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds safe-restart

/usr/lib/jvm