# MonitorinGrafana

A docker-compose example to monitor a local computer with Grafana, Prometheus,
Alertmanager and node-exporter.

## Setup

### Installation
`docker-compose up -d`

### Configuration

##### Data source

Open a browser and connect to http://localhost:3000

![](./img/data-source-configuration.png)

On the homepage, select configuration -> Data Source

![](./img/add-data-source.png)

Add new data source

![](./img/data-source-choice.png)

Choose Prometheus

![](./img/access-method.png)

On the configuration panel, set the access method to "Browser". Just let the defaut url http://localhost:9090

Save and test.

##### Dashboard

![](./img/manage-dashboard.png)

Go to Dashboard -> Manage

![](./img/import-dashboard.png)

Click on Import

![](./img/import-1860.png)

Type 1860 and Load

![](./img/select-prometheus.png)

Select prometheus as the data source and Import.

![](./img/dashboard.png)

So now, you have a fully working monitoring board. Enjoy !
