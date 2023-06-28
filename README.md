# Logstash project example

## Description

This is a sample Docker application that shows you how to configure a logstash agent using a [JDBC driver](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html).

## Configuration

### Create Elastic Stack (ES) addon

Do not connect the Elastic Stack addon to your apps or you'll get the wrong envrironment variables.

#### Connect your apps

Regardless of the language of your app, you'll need to connect your app to the ES on Clever Cloud.

#### Step 1: From the Clever Cloud Console

Follow these steps to connect your app deployed on Clever Cloud to ES:

1. Go to your app menu "Service Dependencies"
2. Choose "Link applications" and select your ES app.
3. Environment variables will be created (ES_ADDON_...)

### Create MYSQL addon

You will need to connect your app to your database on Clever Cloud.
Environment variables will be created (MYSQL_ADDON_...)
 
### logstash.conf settings

In order to dump your data from a database to Elastic Search, you can configure your Dockerfile like the example given in this repository.

You will also need to configure the pipeline/logstash.conf file, making sure to configure the recurrence (schedule) and the request (statement).

