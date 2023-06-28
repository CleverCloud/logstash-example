# Logstash project example

## Description

This is a sample Docker application that shows you how to configure a logstash agent using a [JDBC driver](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html).

## Configuration

### logstash.conf settings

In order to dump your data from a database to Elastic Search, you can configure your Dockerfile like the example given in this repository.
You will also need to configure the pipeline/logstash.conf file, making sure to configure the recurrence (schedule) and the request (statement).
