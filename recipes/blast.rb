#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: blast
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

package ['tar'] do
  action :install
end

include_recipe 'build-essential'
include_recipe 'yum-epel'

# to run the fasta pipeline we need makeblastdb installed
# ubuntu only
if node['platform_family'] == 'debian'
  package 'ncbi-blast+'
elsif node['platform_family'] == 'rhel'
  remote_file "#{Chef::Config[:file_cache_path]}/#{node['blast']['rpm_filename']}" do
    source "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/#{node['blast']['rpm_filename']}"
    not_if { File.exist?('/usr/bin/blastn') }
    action :create_if_missing
  end

  execute 'install ncbi-blast rpm' do
    command "rpm -i --nodeps #{Chef::Config[:file_cache_path]}/#{node['blast']['rpm_filename']}"
    not_if { File.exist?('/usr/bin/blastn') }
  end
end