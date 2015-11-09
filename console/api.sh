#!/bin/bash


function clean {
 echo $(echo $1 | sed 's/ppp_//g' | sed 's/[{}"]//g' | sed 's/:/ /g' | awk '{print $2}')
}

function status {

modemstatus=`curl -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=modem_main_state%2Csignalbar%2Cnetwork_type%2Cnetwork_provider%2Cppp_status&_=1446795036177"`

signalbar=$(clean `curl -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=signalbar&_=1446795036177"`)

modem_main_state=$(clean `curl -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=modem_main_state&_=1446795036177"`)

network_type=$(clean `curl -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=network_type&_=1446795036177"`)

ppp_status=$(clean `curl -s "http://192.168.0.1/goform/goform_get_cmd_process?multi_data=1&isTest=false&cmd=ppp_status&_=1446795036177"`)

#echo signal:$signalbar state:$modem_main_state cell:$network_type link:$ppp_status

echo $signalbar/5 $ppp_status $network_type

}

function ifattached {
 
 lsusb | grep -qc "ZTE WCDMA Technologies MSM"
 return $!
}


function loop {

while [ 1 ] 
do

ifattached && status
sleep 2s

done
}

case "$1" in
 status)
  ifattached && status
  ;;
 *)
  loop
esac

