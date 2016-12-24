#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: bwa
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

include_recipe 'yum-epel'
include_recipe 'build-essential'

remote_file "#{Chef::Config[:file_cache_path]}/#{node['bwa']['filename']}" do
  source node['bwa']['url']
  action :create_if_missing
end

execute 'extract tar ball to install directory' do
  command "tar xjf #{Chef::Config[:file_cache_path]}/#{node['bwa']['filename']} -C #{node['bwa']['install_path']}"
  not_if { ::File.exist?(node['bwa']['dir']) }
end

execute 'make' do
  cwd node['bwa']['dir']
  not_if { ::File.exist?("#{node['bwa']['dir']}/bwa") }
end

## # cannot use link with wild cards
## execute 'create symbolic links in PATH to bwa executables' do
##   command "ln -s -f #{node['bwa']['dir']}/bwa ."
##   cwd node['bwa']['bin_path']
## end

## execute 'make bwa symbolic links executable' do
##   command "chmod -R 755 #{node['bwa']['install_path']}/bin/*"
##   cwd node['bwa']['bin_path']
## end
