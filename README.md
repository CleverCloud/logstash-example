# Logstash project example

## Description

Shows how you can configure logstash to periodically import a mysql table into elasticsearch using the [JDBC driver](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html) input plugin.

## Configuration

### Create Elastic Stack (ES) addon

#### Connect your apps

You'll need to connect your app to the ES on Clever Cloud.
Follow these steps to connect your app deployed on Clever Cloud to ES:

#### From the Clever Cloud Console

1. In your personnal space, click on Create -> an add-on -> select Elastic Stack ...
1. Go to your app menu "Service Dependencies"
2. Choose "Link applications" and select your ES app
3. Environment variables will be created (ES_ADDON_...)

#### From the Clever [CLI](https://www.clever-cloud.com/doc/reference/clever-tools/create/#creating-an-addon)
1. `clever login`
2. Create your add-on and link your app: `clever addon create --region par --plan dev --link <app-name> es-addon <addon-name>`
3. Environment variables will be created (ES_ADDON_...)

### Create MYSQL addon

You will need to connect your app to your database on Clever Cloud.
Environment variables will be created (MYSQL_ADDON_...)
 
### logstash.conf settings

In order to dump your data from a database to Elastic Search, you can configure your Dockerfile like the example given in this repository.

You will also need to configure the pipeline/logstash.conf file, making sure to configure the recurrence (schedule) and the request (statement).

