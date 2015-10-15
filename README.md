Server Console
=================

This is a small work in progress server console system. Essentially on each server you setup an agent that sends a heartbeat to the server console, which then displays information about each server.

If you manage/monitor lots of servers that are not managed under an ESX type system, or want to monitor a lot of physical machines this should fit the bill.

The agent protocol for the heartbeat itself is open so you can roll your own heartbeat monitor if you wanted too.

The goal of this is simply to provide a quick overview of the health and status of your server network without needing some huge enterprise level tool. I couldn't find anything online that really fit the bill on what I was trying to do so I rolled my own.

