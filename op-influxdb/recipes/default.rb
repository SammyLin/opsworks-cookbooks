#
# Cookbook Name:: op-influxdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


# # influxdb
# include_recipe "influxdb"

service "influxdb" do
  action [:enable, :start]
end

# log node[:influxdb][:database]

# if node[:influxdb][:database]
# node[:influxdb][:database].each do |database|
#   influxdb_database database do
#     action :create
#   end
# end
# end

# influxdb_admin node[:influxdb][:admin] do
#   password node[:influxdb][:password]
#   action :create
# end

log  node['influxdb']

           # -  [input_plugins.collectd]
           # -  enabled = false
           # -  # address = "0.0.0.0" # If not set, is actually set to bind-address.
           # -  # port = 25826
           # -  # database = ""
           # -  # types.db can be found in a collectd installation or on github:
           # -  # https://github.com/collectd/collectd/blob/master/src/types.db
           # -  # typesdb = "/usr/share/collectd/types.db" # The path to the collectd types.db file