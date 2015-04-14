#
# Cookbook Name:: op-collectd
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# remote_file "#{Chef::Config[:file_cache_path]}/collectd-#{node["collectd"]["version"]}.tar.gz" do
#   source node["collectd"]["url"]
#   checksum node["collectd"]["checksum"]
#   action :create_if_missing
# end

# bash "install-collectd" do
#   cwd Chef::Config[:file_cache_path]
#   code <<-EOH
#     tar -xzf collectd-#{node["collectd"]["version"]}.tar.gz
#     (cd collectd-#{node["collectd"]["version"]} && ./configure --prefix=#{node["collectd"]["dir"]} && make && make install)
#   EOH
#   not_if "#{node["collectd"]["dir"]}/sbin/collectd -h 2>&1 | grep #{node["collectd"]["version"]}"
# end

# template "/etc/collectd/collectd.conf" do
#   mode "0644"
#   source "collectd.conf.erb"
#   variables(
#     :name         => node["collectd"]["name"],
#     :dir          => node["collectd"]["dir"],
#     :interval     => node["collectd"]["interval"],
#     :read_threads => node["collectd"]["read_threads"]
#   )
#   notifies :restart, "service[collectd]"
# end

# service "collectd" do
#   supports :status => true, :restart => true
#   action [ :enable, :start ]
# end

servers = []

if Chef::Config[:solo]
  if node['collectd']['server_address'].nil?
    servers << '127.0.0.1'
  else
    servers << node['collectd']['server_address']
  end
else
  query = "recipes:#{node['collectd']['server_recipe']} "
  query << "AND chef_environment:#{node.chef_environment}"
  search(:node, query) do |n|
    servers << n['fqdn']
  end
end

log servers

if node[:influxdb][:enable]
template "#{node["collectd"]["dir"]}/etc/conf.d/network.conf" do
  source "collectd_network.conf.erb"
    variables({
       :ipaddress => node[:influxdb][:ipaddress],
       :prot => node[:influxdb][:prot]
     })
end
end

service "collectd" do
  action :restart
end
