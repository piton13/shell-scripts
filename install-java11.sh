#!/bin/bash
# This script adapted from an older post on StackOverflow by user fieldju
# https://stackoverflow.com/questions/36478741/installing-oracle-jdk-on-windows-subsystem-for-linux
# The script was for JDK 8. 
# Due to major changes with JDK 11 (no JRE, no Derby, Unlimited Strength included), it was necessary to update the entire script.
set -ex

namejava=openjdk-11.0.1_linux-x64_bin.tar.gz
# UPDATE THESE URLs (this one updated as of 2019-03-06)
# export JDK_URL=http://download.oracle.com/otn/java/jdk/11.0.4+10/cf1bbcbf431a474eb9fc550051f4ee78/jdk-11.0.4_linux-x64_bin.tar.gz
export JDK_URL=https://download.java.net/java/GA/jdk11/13/GPL/$namejava

# Download Oracle Java 11 accepting the license
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
${JDK_URL}
# Extract the archive
tar -xzvf $namejava
# clean up the tar
rm -fr $namejava
# mk the jvm dir
sudo mkdir -p /usr/lib/jvm
# move the server jre
sudo mv jdk-11.* /usr/lib/jvm/oracle_jdk11

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/oracle_jdk11/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/oracle_jdk11/bin/javac 2000

sudo echo "export J2SDKDIR=/usr/lib/jvm/oracle_jdk11
export J2REDIR=/usr/lib/jvm/oracle_jdk11/
export PATH=$PATH:/usr/lib/jvm/oracle_jdk11/bin
export JAVA_HOME=/usr/lib/jvm/oracle_jdk11" | sudo tee -a /etc/profile.d/oraclejdk.sh
