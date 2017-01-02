#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: omega
#
# Copyright (c) 2017 Davit Bzhalava, All Rights Reserved.

omega_dir = node['omega']['install_path'] + "/omega"
omega_filename = "omega-#{node['omega']['version']}.tar.gz"
omega_url = "http://omega.omicsbio.org/wp-content/uploads/2014/06/#{omega_filename}"

remote_file "#{Chef::Config[:file_cache_path]}/#{omega_filename}" do
  source omega_url
  action :create_if_missing
end

execute 'un-tar omega tar ball' do
  command "tar -xzf #{Chef::Config[:file_cache_path]}/#{omega_filename} -C #{node['omega']['install_path']}"
  creates "#{omega_dir}"
  action :run
  not_if { ::File.exist?("#{omega_dir}") }
end

execute 'make omega in #{omega_dir}' do
  cwd "#{omega_dir}/src/Debug"
  command 'make ' + node['omega']['make_options']
  not_if { ::File.exist?("#{omega_dir}/src/Debug/omega") }
end

# this symlinks every executable in the install subdirectory to /usr/local/bin
# so that they are in the PATH
execute "ln -s #{omega_dir}/src/Debug/omega /usr/bin/omega" do
  cwd node['omega']['install_path']
  not_if { ::File.exist?("/usr/bin/omega") }
end
