# Logstash project example

## Description

Shows how you can configure logstash to periodically import a mysql table into elasticsearch using the [JDBC driver](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html) input plugin.

## Configuration

### Create Elastic Stack (ES) and MYSQL addons

#### Connect your apps

You'll need to connect your app.
Follow these steps to connect your app deployed on Clever Cloud to ES and MYSQL:

#### From the Clever Cloud Console

1. In your personnal space, click on Create -> an add-on -> select Elastic Stack ...
1. Go to your app menu "Service Dependencies"
2. Choose "Link applications" and select your ES app
3. Environment variables will be created (ES_ADDON_...)

Repeat the same steps for MYSQL addon (that will create MYSQL_ADDON... environment variables).

#### From the Clever [CLI](https://www.clever-cloud.com/doc/reference/clever-tools/create/#creating-an-addon)
1. `clever login`
2. Create your ES addon and link your app: `clever addon create --region par --plan <plan-name> --link <app-name> es-addon <addon-name>`
3. Environment variables will be created (ES_ADDON_...)
4. Create your MYSQL addon and link your app: `clever addon create --region par --plan <plan-name> --link <app-name> mysql-addon <addon-name>`
5. Environment variables will be created (MYSQL_ADDON_...)

### logstash.conf settings

In order to dump your data from a database to Elastic Search, you can configure your Dockerfile like the example given in this repository.

You will also need to configure the pipeline/logstash.conf file, making sure to configure the recurrence (schedule) and the request (statement).

