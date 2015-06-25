#
# Cookbook Name:: helios
# Recipe:: users
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#

if platform?("ubuntu") && node['platform_version'].to_f > 14.0
  package "ruby-shadow"
else 
  gem_package "ruby-shadow"
end

group "helios" do
  action :create
end

include_recipe "users"

users_manage "helios" 
