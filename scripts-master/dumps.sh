#!/bin/bash
dt=`date '+%d%m%Y%H%MS'`
host=`hostname`
table=`ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head`
sus=`ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -2 | awk {'print $1'} | grep -iv pid`
sudo mkdir -p /opt/collector
sudo chmod -R 777 /opt/collector
sleep 10
echo 
echo ">> Begin cron script $dt >>"
    echo
    echo " Top processes utilizing high resource consumption in server = $host :::>>"
    echo
    echo "$table"
    echo
    echo
      sudo ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -2 | awk {'print $1'} | grep -iv pid>>/opt/collector/pid_list
      echo ">> Suspected PID utilizing high resource consumption in $host ::>>"
    echo
    echo ">>Thread dump for PID $sus ::>>"
    echo
    list=`ls -l /opt/collector/*.dump`
    echo "$list"
    echo
    echo ">> uploading thread dump to storage bucket :::>>"
    echo
    sudo gsutil cp -r /opt/collector/*.dump gs://$bucket_name}/mule/tuntime/packages/Collector_logs
    echo
    sudo rm -rf /opt/collector/*
    ls -l /opt/collector
echo ">>>> End cron script $dt >>"

#normally it can be automated directly for java process, in server java process will always be consuming the most ram in my use-case
#top -n 1 -H -p [pid of muleruntime]
