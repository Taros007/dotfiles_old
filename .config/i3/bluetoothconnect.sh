#!/bin/bash

# enable bluetooth
sudo systemctl start bluetooth

sleep 1

# run the program bluez
echo -e 'power on\nconnect \t \nquit' | bluetoothctl
echo -e 'Please press the play-button on the Sony'
sleep 5
pactl set-card-profile bluez_card.CC_98_8B_4A_C6_01 a2dp_sink_ldac 
