#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: default
#
# Copyright:: 2016, The Authors, All Rights Reserved.

include_recipe "VirusSlayer-chef-cookbooks::_common"
include_recipe "VirusSlayer-chef-cookbooks::R"
include_recipe "VirusSlayer-chef-cookbooks::py-packages"
include_recipe "VirusSlayer-chef-cookbooks::diginorm"
include_recipe "VirusSlayer-chef-cookbooks::blast"
include_recipe "VirusSlayer-chef-cookbooks::bwa"
include_recipe "VirusSlayer-chef-cookbooks::cpan"
