#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: emboss
#
# Copyright (c) 2017 Davit Bzhalava, All Rights Reserved.

emboss_dir = node['emboss']['install_path'] + "/EMBOSS-" + node['emboss']['version']
emboss_filename = "EMBOSS-#{node['emboss']['version']}.tar.gz"
emboss_url = "ftp://emboss.open-bio.org/pub/EMBOSS/#{emboss_filename}"

remote_file "#{Chef::Config[:file_cache_path]}/#{emboss_filename}" do
  source emboss_url
  action :create_if_missing
end

execute 'un-tar emboss tar ball' do
  command "tar -xzf #{Chef::Config[:file_cache_path]}/#{emboss_filename} -C #{node['emboss']['install_path']}"
  creates "#{emboss_dir}"
  action :run
  not_if { ::Dir.exist?("#{emboss_dir}") }
end

execute 'configure emboss in #{emboss_dir}' do
  cwd emboss_dir
  command './configure'
end

execute 'make emboss in #{emboss_dir}' do
  cwd emboss_dir
  command 'make'
end

execute 'make install emboss in #{emboss_dir}' do
  cwd emboss_dir
  command 'make install'
end
