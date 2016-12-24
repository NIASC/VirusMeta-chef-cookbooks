#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: _common
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.
directory node.dir.software
package "git"

khmer_githuburl  = node['VirusSlayer-chef-cookbooks']['khmer_githuburl']
khmer_dir        = "#{node.dir.software}/khmer"
screed_githuburl = node['VirusSlayer-chef-cookbooks']['screed_githuburl']
screed_dir       = "#{node.dir.software}/screed"

git "git_clone_khmer" do
  action :checkout
  repository khmer_githuburl
  destination khmer_dir
  not_if "#{Dir.exists?( khmer_dir )}"
  retries 1
end

git "git_clone_screed" do
  action :checkout
  repository screed_githuburl
  destination screed_dir
  not_if "#{Dir.exists?( screed_dir )}"
retries 1
end

script 'install screed' do
  interpreter 'bash'
  user 'root'
  cwd screed_dir
  code <<-EOF
  python setup.py install
  EOF
  #####
  #not_if "#{node.dir.software}/python -c \"import sys; import screed; sys.exit( 0 if '#{screed_version}' == screed.__version__ else 1)\" 2> /dev/null"
  #####
end

execute 'export screed' do
  command "export PYTHONPATH=$PYTHONPATH:screed_dir"
  cwd screed_dir
  action :run
end

execute 'install khmer' do
  #command "make test"
  command "python setup.py install"
  cwd khmer_dir
  action :run
end