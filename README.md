## Teamcity Docker examples

https://blog.jetbrains.com/teamcity/2016/06/teamcity-on-docker-hub-its-official-now/

#### Makefile

A make script showing examples of how to run teamcity in docker with a single agent

Also contains a make task for upgrading the server

* `make launch-tc-server` - Starts the Teamcity server
* `make run-agent` - Starts an agent and links it to the TC server

#### docker-compose

Theres also a docker-compose.yml that does the same thing

Run with `docker-compose up -d`
