#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: soapdenovo
#
# Copyright (c) 2017 Davit Bzhalava, All Rights Reserved.

include_recipe 'build-essential'

SOAPdenovo2_dir = node['SOAPdenovo2']['install_path'] + "/SOAPdenovo2-bin-LINUX-generic-#{node['SOAPdenovo2']['version']}"
SOAPdenovo2_filename = "SOAPdenovo2-bin-LINUX-generic-#{node['SOAPdenovo2']['version']}.tgz"
SOAPdenovo2_url = "http://sourceforge.net/projects/soapdenovo2/files/SOAPdenovo2/bin/#{node['SOAPdenovo2']['version']}/#{SOAPdenovo2_filename}"

remote_file "#{Chef::Config[:file_cache_path]}/#{SOAPdenovo2_filename}" do
  source SOAPdenovo2_url
  action :create_if_missing
end

execute 'un-tar SOAPdenovo2 tar ball' do
  command "tar -xzf #{Chef::Config[:file_cache_path]}/#{SOAPdenovo2_filename} -C #{node['SOAPdenovo2']['install_path']}"
  creates "#{SOAPdenovo2_dir}"
  action :run
  not_if { ::File.exist?("#{SOAPdenovo2_dir}/README") }
end

execute 'make SOAPdenovo2 in #{SOAPdenovo2_dir}' do
  cwd SOAPdenovo2_dir
  command 'make ' + node['SOAPdenovo2']['make_options']
  not_if { ::File.exist?("#{SOAPdenovo2_dir}/SOAPdenovo-63mer") }
end

# this symlinks every executable in the install subdirectory to /usr/local/bin
# so that they are in the PATH
execute "ln -s #{SOAPdenovo2_dir}/SOAPdenovo-63mer /usr/bin/SOAPdenovo-63mer" do
  cwd node['SOAPdenovo2']['install_path']
  not_if { ::File.exist?("/usr/bin/SOAPdenovo-63mer") }
end


SOAPdenovotrans_dir = node['SOAPdenovotrans']['install_path'] + '/' + "SOAPdenovo-Trans-bin-#{node['SOAPdenovotrans']['version']}"
SOAPdenovotrans_filename = "SOAPdenovo-Trans-bin-#{node['SOAPdenovotrans']['version']}.tar.gz"
SOAPdenovotrans_url = "http://sourceforge.net/projects/soapdenovotrans/files/SOAPdenovo-Trans/bin/#{node['SOAPdenovotrans']['version']}/#{SOAPdenovotrans_filename}"

remote_file "#{Chef::Config[:file_cache_path]}/#{SOAPdenovotrans_filename}" do
  source SOAPdenovotrans_url
  action :create_if_missing
end

bash "create #{SOAPdenovotrans_dir}" do
    code "mkdir #{SOAPdenovotrans_dir}"
    not_if { ::File.directory?("#{SOAPdenovotrans_dir}") }
end

execute 'un-tar SOAPdenovotrans tar ball' do
  cwd SOAPdenovotrans_dir
  command "tar -xzf #{Chef::Config[:file_cache_path]}/#{SOAPdenovotrans_filename}"
  action :run
  not_if { ::File.exist?("#{SOAPdenovotrans_dir}/SOAPdenovo-Trans-31mer") }
end


# this symlinks every executable in the install subdirectory to /usr/local/bin
# so that they are in the PATH
execute "ln -s #{SOAPdenovotrans_dir}/SOAPdenovo-Trans-31mer /usr/bin/SOAPdenovo-Trans-31mer" do
  cwd node['SOAPdenovotrans']['install_path']
  not_if { ::File.exist?("/usr/bin/SOAPdenovo-Trans-31mer") }
end

# this symlinks every executable in the install subdirectory to /usr/local/bin
# so that they are in the PATH
execute "ln -s #{SOAPdenovotrans_dir}/SOAPdenovo-Trans-127mer /usr/bin/SOAPdenovo-Trans-127mer" do
  cwd node['SOAPdenovotrans']['install_path']
  not_if { ::File.exist?("/usr/bin/SOAPdenovo-Trans-127mer") }
end