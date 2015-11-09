#!/bin/sh

CWD=`pwd`

cd `dirname $0`
mkdir /opt/mf730m
cp -vprf * /opt/mf730m/
cd $CWD

