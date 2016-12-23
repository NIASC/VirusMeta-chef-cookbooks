#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: numpy
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

package "build-essential"
package "python-devel"
package "python-pip"

bash "install_numpy" do
  code "pip install numpy"
  not_if "#{Dir.exists?( "/usr/lib/python2.7/site-packages/numpy" )}"
  retries 1
end
