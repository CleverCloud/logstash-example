FROM docker.elastic.co/logstash/logstash:8.8.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/

EXPOSE 9600
