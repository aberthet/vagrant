#!/bin/bash

# Update CentOS
yum update -y --exclude=kernel
# Tools
yum install -y vim git unzip screen nc telnet

