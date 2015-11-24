#!/bin/bash
 
INTERVAL="1"  # update interval in seconds
 
if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi
 
IF=$1
 
while true
do
        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        RR1=`cat /sys/class/net/$2/statistics/rx_bytes`
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        TT1=`cat /sys/class/net/$2/statistics/tx_bytes`
        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        RR2=`cat /sys/class/net/$2/statistics/rx_bytes`
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        TT2=`cat /sys/class/net/$2/statistics/tx_bytes`
        TBPS1=`expr $T2 - $T1`
        TBPS2=`expr $TT2 - $TT1`
        RBPS1=`expr $R2 - $R1`
        RBPS2=`expr $RR2 - $RR1`
        TKBPS1=`expr $TBPS1 / 1024`
        TKBPS2=`expr $TBPS2 / 1024`
        RKBPS1=`expr $RBPS1 / 1024`
        RKBPS2=`expr $RBPS2 / 1024`
        echo "TX $1: $TKBPS1 kB/s RX $1: $RKBPS1 kB/s ---- TX $2: $TKBPS2 kB/s RX $2: $RKBPS2 kB/s"
done
