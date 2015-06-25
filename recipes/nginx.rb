#
# Cookbook Name:: helios
# Recipe:: nginx
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#

include_recipe "nginx::default"

nginx_conf_file "helios01.poweredbypurple.ca" do
  server_name ["helios01.poweredbypurple.ca"]
  block ["access_log #{node['nginx']['log_dir']}/helios01.poweredbypurple.ca.access.log;", "error_log #{node['nginx']['log_dir']}/helios01.poweredbypurple.ca.error.log error;"]
  upstream ({"helios" => ["server localhost:8000"]})
  locations({"/" => ["proxy_pass http://helios/", "proxy_connect_timeout 60s", "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for", "proxy_set_header Host $http_host", "proxy_redirect off"]})
  site_type :dynamic
end

