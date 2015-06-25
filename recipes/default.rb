#
# Cookbook Name:: helios
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#

include_recipe "python::default"

package "git"

directory "/srv/helios-server" do
  recursive true
  action :create
end

deploy_revision "/srv/helios-server" do
  migrate false
  repo "https://github.com/markcallen/helios-server"
  branch "nodejs"
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear
  user "helios"
  group "helios"
  action :deploy
end

python_virtualenv "/srv/helios-server/current/venv" do
  owner "helios"
  group "helios"
  action :create
end

bash "install_requirements" do
  user "helios"
  cwd "/srv/helios-server/current"
  code <<-EOH
    source venv/bin/activate
    pip install -r requirements.txt
  EOH
end

