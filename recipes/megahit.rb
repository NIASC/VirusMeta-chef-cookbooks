#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: megahit
#
# Copyright (c) 2017 Davit Bzhalava, All Rights Reserved.

megahit_githuburl  = node['megahit']['megahit_githuburl']
megahit_dir        = "#{ node['megahit']['install_path'] }/megahit"

git "git_clone_megahit" do
  action :checkout
  repository megahit_githuburl
  destination megahit_dir
  not_if "#{Dir.exists?( megahit_dir )}"
  retries 1
end

execute 'make megahit in #{megahit_dir_dir}' do
  cwd megahit_dir
  command 'make ' + node['megahit']['make_options']
  not_if { ::File.exist?("#{megahit_dir}/megahit") }
end

execute "ln -s #{megahit_dir}/megahit /usr/bin/megahit" do
  cwd megahit_dir
  not_if { ::File.exist?("/usr/bin/megahit") }
end
