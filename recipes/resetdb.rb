#
# Cookbook Name:: helios
# Recipe:: resetdb.rb
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#

template "/srv/helios-server/current/resetdb.sh" do
  source "reset.sh.erb"
  mode 0755
  owner "helios"
  group "helios"
  variables({
    :google => node[:helios][:google]
  })
end

bash "resetdb" do
  user "postgres"
  cwd "/srv/helios-server/current"
  code <<-EOH
    source venv/bin/activate
    ./resetdb.sh
  EOH
end
