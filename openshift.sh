#!/bin/sh

## login to server
oc login -u developer -p developer --server https://172.17.0.43:8443 --insecure-skip-tls-verify

## create project 

oc new-project testdocker

## Create App within project

oc new-app https://github.com/chhayang/TestDocker.git --strategy=docker
sleep 30s

## check build logs

oc logs -f bc/testdocker &&

## check build status

oc status

## expose service

oc expose service testdocker

## url 

oc get route

##







