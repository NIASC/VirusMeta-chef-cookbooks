#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: trinity
#
# Copyright (c) 2017 Davit Bzhalava, All Rights Reserved.

include_recipe 'build-essential'

trinity_githuburl  = node['trinity']['trinity_githuburl']
trinity_dir        = "#{ node['trinity']['install_path'] }/trinity"

git "git_clone_trinity" do
  action :checkout
  repository trinity_githuburl
  destination trinity_dir
  not_if "#{Dir.exists?( trinity_dir )}"
  retries 1
end

execute 'make trinity in #{trinity_dir_dir}' do
  cwd trinity_dir
  command 'make ' + node['trinity']['make_options']
  ## not_if { ::File.exist?("#{trinity_dir}/trinity") }
end

## execute "ln -s #{trinity_dir}/trinity /usr/bin/trinity" do
##  cwd trinity_dir
##  not_if { ::File.exist?("/usr/bin/trinity") }
## end
