FROM docker.elastic.co/logstash/logstash:9.3.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD --chown=logstash:root mysql-connector-j-9.6.0.jar /usr/share/logstash/logstash-core/lib/jars/
ADD pipeline/ /usr/share/logstash/pipeline/

ENV API_HTTP_HOST=0.0.0.0
ENV API_HTTP_PORT=8080

EXPOSE 8080
