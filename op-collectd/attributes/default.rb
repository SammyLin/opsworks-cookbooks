default["collectd"]["version"]            = "5.4.2"
default["collectd"]["dir"]                = "/opt/collectd"
default["collectd"]["plugins_conf_dir"]    = ::File.join(node["collectd"]["dir"], "etc", "conf.d")
default["collectd"]["url"]                = "http://collectd.org/files/collectd-#{node["collectd"]["version"]}.tar.gz"
default["collectd"]["checksum"]           = "9778080ee9ee676c7130b1ce86c2843c7359e29b9bd1c1c0e48fcd9cccf089eb"
default["collectd"]["interval"]           = 10
default["collectd"]["read_threads"]       = 5
default["collectd"]["name"]               = node["fqdn"]

default["influxdb"]["enable"]             = false
default["influxdb"]["ip"]                 = "127.0.0.1"
default["influxdb"]["prot"]               = "25826"


default["influxdb"]["enable"] = false
default["influxdb"]["ipaddress"] = "127.0.0.1"
default["influxdb"]["prot"] = "25826"