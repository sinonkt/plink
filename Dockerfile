# MAINTAINER oatkrittin@gmail.com
# credit gelog for plink template
# Pull base image
FROM ubuntu:16.04

# Installation instructions: https://www.cog-genomics.org/plink2

# Environment variables
# 150314 == plink 1.9 beta 3
# 180612 == plink 1.9 beta 6.2
ENV PLINK_VERSION       180612
ENV PLINK_HOME          /usr/local/plink
ENV PATH                $PLINK_HOME:$PATH


RUN apt-get update && \
    apt-get install -y unzip wget && \
    wget https://www.cog-genomics.org/static/bin/plink${PLINK_VERSION}/plink_linux_x86_64.zip && \
    unzip plink_linux_x86_64.zip -d $PLINK_HOME && \
    rm plink_linux_x86_64.zip && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -y unzip wget && \
    rm -rf /var/lib/apt/lists/*
