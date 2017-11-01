#
# Cookbook:: postgresql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

# install pkg
package 'postgresql-server' do
	notifies :run,'execute[postgresql-init]'
end

# init after install
execute 'postgresql-init' do
	command 'postgresql-setup initdb'
	action :nothing
end

# enable and start
service 'postgresql' do
	action [:enable, :start]
end

