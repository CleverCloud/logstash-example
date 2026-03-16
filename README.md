# Logstash Example Application on Clever Cloud

[![Clever Cloud - PaaS](https://img.shields.io/badge/Clever%20Cloud-PaaS-orange)](https://clever-cloud.com)

This is a minimal Logstash application deployed as a Docker instance on Clever Cloud. It periodically imports data from a MySQL database into Elasticsearch using the [JDBC input plugin](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html).

## About the Application

This application runs a Logstash pipeline that:
- Connects to a MySQL database via JDBC
- Executes a SQL query on a configurable schedule (every minute by default)
- Indexes the results into an Elasticsearch cluster

## Technology Stack

- [Logstash](https://www.elastic.co/logstash) 9.3.1 - Data processing pipeline
- [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/) 9.6.0 - JDBC driver for MySQL
- Docker

## Prerequisites

- A Clever Cloud account
- A MySQL add-on with data to index
- An Elastic Stack add-on as the indexing destination

## Pipeline Configuration

The pipeline is defined in `pipeline/logstash.conf`. You can customize:

- `schedule` - Cron expression for how often the query runs (default: `* * * * *`, every minute)
- `statement` - The SQL query to execute (default: `SELECT * from songs`)
- `index` - The Elasticsearch index name (default: `songs`)

## Deploying on Clever Cloud

You have two options to deploy your Logstash application on Clever Cloud: using the Web Console or using the Clever Tools CLI.

### Option 1: Deploy using the Web Console

#### 1. Create an account on Clever Cloud

If you don't already have an account, go to the [Clever Cloud console](https://console.clever-cloud.com/) and follow the registration instructions.

#### 2. Set up your application on Clever Cloud

1. Log in to the [Clever Cloud console](https://console.clever-cloud.com/)
2. Click on "Create" and select "An application"
3. Choose "Docker" as the runtime environment
4. Configure your application settings (name, region, etc.)

#### 3. Create and Link Add-ons

You need to create and link both a MySQL add-on and an Elastic Stack add-on to your application:

**MySQL add-on:**

1. In your personal space, click on "Create" and select "An add-on"
2. Choose "MySQL" and configure it (plan, region, etc.)
3. Go to your application's "Service Dependencies" menu
4. Click "Link add-ons" and select your MySQL add-on
5. Environment variables will be automatically created (`MYSQL_ADDON_HOST`, `MYSQL_ADDON_PORT`, `MYSQL_ADDON_DB`, `MYSQL_ADDON_USER`, `MYSQL_ADDON_PASSWORD`)

**Elastic Stack add-on:**

1. In your personal space, click on "Create" and select "An add-on"
2. Choose "Elastic Stack" and configure it (plan, region, etc.)
3. Go to your application's "Service Dependencies" menu
4. Click "Link add-ons" and select your Elastic Stack add-on
5. Environment variables will be automatically created (`ES_ADDON_HOST`, `ES_ADDON_USER`, `ES_ADDON_PASSWORD`)

#### 4. Deploy Your Application

You can deploy your application using Git:

```bash
# Add Clever Cloud as a remote repository
git remote add clever git+ssh://git@push-par-clevercloud-customers.services.clever-cloud.com/app_<your-app-id>.git

# Push your code to deploy
git push clever master
```

### Option 2: Deploy using Clever Tools CLI

#### 1. Install Clever Tools

Install the Clever Tools CLI following the [official documentation](https://www.clever-cloud.com/doc/clever-tools/getting_started/):

```bash
# Using npm
npm install -g clever-tools

# Or using Homebrew (macOS)
brew install clever-tools
```

#### 2. Log in to your Clever Cloud account

```bash
clever login
```

#### 3. Create a new application

```bash
clever create --type docker <YOUR_APP_NAME>
```

#### 4. Create and link add-ons

```bash
# Create and link a MySQL add-on
clever addon create mysql-addon <MYSQL_ADDON_NAME> --plan <plan-name> --link <YOUR_APP_NAME>

# Create and link an Elastic Stack add-on
clever addon create es-addon <ES_ADDON_NAME> --plan <plan-name> --link <YOUR_APP_NAME>
```

Environment variables (`MYSQL_ADDON_*` and `ES_ADDON_*`) are automatically injected when add-ons are linked.

#### 5. Deploy your application

```bash
clever deploy
```

### Monitoring Your Application

Once deployed, you can monitor your application through:

- **Web Console**: The Clever Cloud console provides logs, metrics, and other tools to help you manage your application.
- **CLI**: Use `clever logs` to view application logs and `clever status` to check the status of your application.

## Additional Resources

- [Logstash Documentation](https://www.elastic.co/guide/en/logstash/current/index.html)
- [Logstash JDBC Input Plugin](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html)
- [Clever Cloud Docker Documentation](https://www.clever-cloud.com/developers/doc/applications/docker/)
- [Clever Cloud MySQL Documentation](https://www.clever-cloud.com/developers/doc/addons/mysql/)
- [Clever Cloud Elastic Stack Documentation](https://www.clever-cloud.com/developers/doc/addons/elastic/)
