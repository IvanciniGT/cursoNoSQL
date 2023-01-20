docker run \
    --name mineo \
    -p 8080:7474 -p 7687:7687  -p 7473:7473 \
    --env NEO4J_dbms_connector_https_advertised__address="54.75.63.152:7473" \
	--env NEO4J_dbms_connector_http_advertised__address="54.75.63.152:8080" \
	--env NEO4J_dbms_connector_bolt_advertised__address="54.75.63.152:7687" \
	-d \
    --env NEO4J_AUTH=neo4j/password \
    neo4j:latest
