#
# Cookbook Name:: helios
# Recipe:: upstart 
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#

template "helios-server.upstart.conf" do
  path "/etc/init/helios-server.conf"
  source "helios-server.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :env => node[:helios][:env]
  })
end

service "helios-server" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "helios-celery.upstart.conf" do
  path "/etc/init/helios-celery.conf"
  source "helios-celery.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :env => node[:helios][:env]
  })
end

service "helios-celery" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

