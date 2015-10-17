Server Console
=================
[![Build Status](https://travis-ci.org/keslerm/server_console.svg?branch=master)](https://travis-ci.org/keslerm/server_console)

This is a small work in progress server console system. Essentially on each server you setup an agent that sends a heartbeat to the server console, which then displays information about each server.

If you manage/monitor lots of servers that are not managed under an ESX type system, or want to monitor a lot of physical machines this should fit the bill.

The agent protocol for the heartbeat itself is open so you can roll your own heartbeat monitor if you wanted too.

The goal of this is simply to provide a quick overview of the health and status of your server network without needing some huge enterprise level tool. I couldn't find anything online that really fit the bill on what I was trying to do so I rolled my own.

## Sample curl for updating heartbeat: 
```
curl --request POST 'localhost:3000/heartbeat' --data-urlencode 'name=rogbox1' --data-urlencode 'hostname=rogbox1' --data-urlencode 'token=123-ac23a-331' --data-urlencode 'uptime=0:08  up 2 days,  8:59, 7 users, load averages: 1.31 1.44 1.41' --data-urlencode 'mem_used=2048' --data-urlencode 'mem_total=10240' --data-urlencode "cpu_usage=1.53"
```

## Sample heartbeat bash script, WIP
```
#!/bin/bash

SERVER=localhost:3000
NAME=rogbox1
HOSTNAME=`hostname -s`
TOKEN=123-ac23a-331
DATE=`date`
UPTIME=`uptime`
CPUUSAGE=`w | head -n1 | cut -d":" -f4`
MEMUSED=1024
MEMTOTAL=4096
curl --request POST "$SERVER/heartbeat" --data-urlencode "name=$NAME" --data-urlencode "hostname=$HOSTNAME" --data-urlencode "token=$TOKEN" --data-urlencode "uptime=$UPTIME" --data-urlencode "date=$DATE" --data-urlencode "mem_used=$MEMUSED"  --data-urlencode "mem_total=$MEMTOTAL" --data-urlencode "cpu_usage=$CPUUSAGE"
```
