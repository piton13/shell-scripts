#!/bin/bash

# get url from https://kafka.apache.org/downloads
# url = http://apache.mirrors.lucidnetworks.net/kafka/2.4.0/kafka_2.13-2.4.0.tgz

cd ~
wget http://apache.mirrors.lucidnetworks.net/kafka/2.4.0/kafka_2.13-2.4.0.tgz
tar -xvf kafka_2.13-2.4.0.tgz -C ~
