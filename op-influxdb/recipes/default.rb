#
# Cookbook Name:: op-influxdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


# influxdb
# include_recipe "influxdb"

service "influxdb" do
  action [:enable, :start]
end

log node[:influxdb][:database]

if node[:influxdb][:database]
node[:influxdb][:database].each do |database|
  influxdb_database database do
    action :create
  end
end
end

influxdb_admin node[:influxdb][:admin] do
  password node[:influxdb][:password]
  action :create
end