#!/bin/bash

BASEDIR=`dirname $0`

function clean {
  echo $(echo $1 | sed 's/[{}"]//g' | sed 's/:/ /g' | awk '{print $2}')
}

function querystate {

  echo $(curl --connect-timeout 1 -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=$1")

}

function status {

  signalbar=$(clean $(querystate signalbar))

  network_type=$(clean $(querystate network_type))

  echo "<img>$BASEDIR/signal-$signalbar.png</img><txt> $network_type</txt>"

}

function ifattached {
 
  lsusb | grep -qc "ZTE WCDMA Technologies MSM"
  return $?

}

if ifattached
then
 status
else
 echo "<txt> </txt>"
fi


