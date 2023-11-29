#!/bin/bash
wget http://localhost:1809/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://localhost:1809/ who-am-i

java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin adoptopenjdk
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin sonar
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin nodejs
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin dependency-check-jenkins-plugin
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin docker-plugin
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin docker-commons
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin docker-workflow
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin docker-java-api
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds install-plugin docker-build-step
java -jar jenkins-cli.jar -s http://localhost:1809/ -auth @creds safe-restart


