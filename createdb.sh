#!/bin/bash

mkdir data
cd data
mkdir postgres
mkdir pgadmin
cd ..
sudo docker-compose up -d
