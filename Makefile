SERVER_NAME=teamcity-server-instance
SERVER_PORT=8111
AGENT_NAME=teamcity-agent-01

launch-tc-server:
	docker run -d \
	  --name $(SERVER_NAME) \
	  -v /teamcity/data:/data/teamcity_server/datadir \
	  -v /teamcity/logs:/opt/teamcity/logs \
	  -p $(SERVER_PORT):8111 \
	  jetbrains/teamcity-server

run-agent:
	docker run -d \
		--name $(AGENT_NAME) \
		--env SERVER_URL=http://teamcity:$(SERVER_PORT) \
		--link $(SERVER_NAME):teamcity \
		-v /teamcity/agent/conf:/data/teamcity_agent/conf \
		jetbrains/teamcity-agent

upgrade-teamcity:
	docker pull jetbrains/teamcity-server
	docker stop $(SERVER_NAME)
	docker rm $(SERVER_NAME)
	make launch-tc-server

upgrade-agent:
	docker pull jetbrains/teamcity-agent
	docker stop $(AGENT_NAME)
	docker rm $(AGENT_NAME)
	make run-agent
