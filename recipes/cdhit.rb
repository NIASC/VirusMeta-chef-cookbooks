#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: cdhit
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

include_recipe 'build-essential'

cdhit_dir = node['cdhit']['install_path'] + '/' + 'cd-hit-' + node['cdhit']['version']
cdhit_filename = "cd-hit-#{node['cdhit']['version']}.tgz"
cdhit_url = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cdhit/#{cdhit_filename}"

## remote_file "#{python_download_dir}/numpy-#{numpy_version}.tar.gz" do
remote_file "#{Chef::Config[:file_cache_path]}/#{cdhit_filename}" do
  source cdhit_url
  action :create_if_missing
end

execute 'un-tar cd-hit tar ball' do
  command "tar -xzf #{Chef::Config[:file_cache_path]}/#{cdhit_filename} -C #{node['cdhit']['install_path']}"
  creates "#{cdhit_dir}"
  action :run
  not_if { ::File.exist?("#{cdhit_dir}/README") }
end

execute 'make cd-hit in #{cdhit_dir}' do
  cwd cdhit_dir
  command 'make ' + node['cdhit']['make_options']
  not_if { ::File.exist?("#{cdhit_dir}/cd-hit") }
end

# this symlinks every executable in the install subdirectory to /usr/local/bin
# so that they are in the PATH
execute "find #{cdhit_dir} -maxdepth 2 -executable -type f -exec ln -s {} /usr/bin \\;" do
  cwd node['cdhit']['install_path']
end

## magic_shell_environment 'cdhit_VERSION' do
##   value node['cdhit']['version']
## end

## magic_shell_environment 'cdhit_DIR' do
##   value cdhit_dir
## end
