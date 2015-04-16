#
# Cookbook Name:: op-influxdb
# Recipe:: op-influxdb
#
# Copyright (C) 2015 Sammy
#
# All rights reserved - Do Not Redistribute
#

package "vim"

include_recipe "collectd"

include_recipe "influxdb"

service "influxdb" do
  action [:enable, :start]
end

# Create Influxdb Database
node[:influxdb][:database].each do |database|
influxdb_database database do
  action :create
end
end

# Create Influxdb Admin
influxdb_admin node[:influxdb][:admin] do
  password node[:influxdb][:password]
  action :create
end
