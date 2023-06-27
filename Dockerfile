FROM docker.elastic.co/logstash/logstash:8.8.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD --chown=logstash:root mysql-connector-j-8.0.33.jar /usr/logstash/logstash-core/lib/jars/
ADD pipeline/ /usr/share/logstash/pipeline/

EXPOSE 9600
