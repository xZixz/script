#!/bin/bash

printf "Device's pairing IP address & port: "
read -r ip_address_and_port

printf 'Pairing code: '
read -r pairing_code

echo $pairing_code | adb pair $ip_address_and_port > /dev/null

[[ $ip_address_and_port =~ (.*):[0-9]* ]]
ip_address=${BASH_REMATCH[1]}

printf 'Connecting port: '
read -r port
adb connect $ip_address:$port > /dev/null

if [ $? -eq 0 ]; then
  echo 'Succeeded'
else
  echo 'Failed'
fi
