#!/usr/bin/env bash

# 0.1 Start the elasticsearch and kibana as a prerequisite
/opt/elastic/elasticsearch-7.6.2/bin/elasticsearch > logs/elasticsearch.log &

sleep 10s
# 0.1 Start the kibana as a prerequisite
/opt/elastic/kibana-7.6.2-linux-x86_64/bin/kibana  > logs/kibana.log &

sleep 10s
# 1. Start the Discovery server
java -jar ./jars/discovery-server-0.1-SNAPSHOT.jar   > logs/discovery.log &

sleep 10s
# 4. Start the data-management service
java -jar ./jars/data-management-0.1-SNAPSHOT.jar    > logs/data-management.log &

sleep 10s
# 7. Start the elastic-interface service
java -jar ./jars/elastic-interface-0.1-SNAPSHOT.jar    > logs/elastic-interface.log &

sleep 1s
# 10. Start the LimeSurvey service
# extends defatul application.yml with application-limesurvey.yml
java -jar ./jars/limesurvey-0.0.1-SNAPSHOT.jar  --spring.profiles.active=dev  > logs/limesurvey.log &

sleep 1s
# 11. Start the user-management service
java -jar ./jars/user-management-0.0.1-SNAPSHOT.jar --spring.profiles.active=dev  > logs/user-management.log &
