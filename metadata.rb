name             'helios'
maintainer       'Mark C Allen'
maintainer_email 'mark@markcallen.com'
license          'All rights reserved'
description      'Installs/Configures helios'
long_description 'Installs/Configures helios'
version          '0.1.0'

%w{ ubuntu }.each do |os|
  supports os
end

%w{ nginx nginx_conf git postgresql python users }.each do |cb|
  depends cb
end
