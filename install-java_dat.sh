#!/bin/bash
# This script adapted from an older post on StackOverflow by user fieldju
# https://stackoverflow.com/questions/36478741/installing-oracle-jdk-on-windows-subsystem-for-linux
# The script was for JDK 8. 
# Due to major changes with JDK 11 (no JRE, no Derby, Unlimited Strength included), it was necessary to update the entire script.

set -ex

cd ~
namejava=bellsoft-jdk11.0.6+10-linux-amd64.tar.gz

cp java-jdks/$namejava .
tar -xzvf $namejava
sudo mkdir -p /usr/lib/jvm

sudo mv jdk-11.* /usr/lib/jvm/oracle_jdk11

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/oracle_jdk11/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/oracle_jdk11/bin/javac 2000

sudo echo "export J2SDKDIR=/usr/lib/jvm/oracle_jdk11
export J2REDIR=/usr/lib/jvm/oracle_jdk11/
export PATH=$PATH:/usr/lib/jvm/oracle_jdk11/bin
export JAVA_HOME=/usr/lib/jvm/oracle_jdk11" | sudo tee -a /etc/profile.d/oraclejdk.sh
