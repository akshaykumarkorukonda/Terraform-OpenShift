#!/bin/bash

systemctl is-active --quiet NetworkManager

if [ $? -eq 0 ]; then
    nmcli con mod ens192 ipv4.dns-search "utdlab.com utd.com"
    systemctl restart NetworkManager
    printf "Search domains added.\n"
else
    printf "NetworkManager not present.\n"
    exit 1
fi
exit 0