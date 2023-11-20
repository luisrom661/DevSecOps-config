#!/bin/bash
wget http://${ec2_instance}:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ who-am-i 
vi creds
    admin:114639dad71fa75503242bc1f1bc181449
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds install-plugin ${plugin_name} (sonar)
java -jar jenkins-cli.jar -s http://34.224.62.119:8080/ -auth @creds safe-restart