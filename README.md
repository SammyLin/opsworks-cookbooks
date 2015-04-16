# commandp opswork cookbook

## recepis

### op-influxdb

run_list

    recipe[apt]
    recipe[collectd]
    recipe[op-influxdb]
    recipe[collectd::attribute_driven]
    recipe[grafana]
    recipe[java]
    recipe[elasticsearch]

安裝以下幾個服務

* influxdb
* grafana
* java
* elasticsearch
* collectd

預設 attribute

    default["influxdb"]["database"] = ["collectd"]
    default["influxdb"]["admin"] = "admin"
    default["influxdb"]["password"] = "password"
    default['grafana']['graphite_user']
    default['grafana']['graphite_password']
    default['grafana']['admin_password']
    default['grafana']['webserver_listen']
    default['grafana']['window_title_prefix']
    default['grafana']['datasources'] # 如果要改這個請到 op-influxdb 去改

### op-collectd

安裝 collectd 收集資訊

run_list

    recipe[apt]
    recipe[collectd]
    recipe[collectd::attribute_driven]
    recipe[op-collectd]


預設 attribute

    default["collectd"]["influxdb"]["enabled"] = false
    default["collectd"]["influxdb"]["ipaddress"] = "127.0.0.1"
    default["collectd"]["influxdb"]["prot"] = "25826"



