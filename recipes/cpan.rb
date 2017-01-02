#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: cpan
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

include_recipe 'perl'
include_recipe 'cpan'
cpan_module 'Getopt::Long'
cpan_module 'List::MoreUtils'
cpan_module 'Module::Build'
cpan_module 'ExtUtils::CBuilder'
cpan_module 'Params::Validate'
cpan_module 'Regexp::Common'
cpan_module 'Readonly'
cpan_module 'Text::Format'
cpan_module 'IO::String'
cpan_module 'Config::General'
cpan_module 'Tie::IxHash'
cpan_module 'Parallel::ForkManager'
cpan_module 'Module::Build'
## cpan_module 'Bio::DB:Sam'
## cpan_module 'Bundle::CPAN'

cpan_packages = %w(Set-IntSpan
                  Params-Validate
                  Test-Simple
                  XML-NamespaceSupport
                  XML-SAX-Base
                  XML-SAX
                  libwww-perl
                  XML-Parser
                  XML-SAX-Expat
                  XML-Simple
                  Digest-MD5
                  Clone
                  Config-General
                  Font-TTF
                  GD
                  List-MoreUtils
                  Math-Bezier
                  Math-Round
                  Math-VecStat
                  IPC-Cmd
                  Test-Warn
                  Test-Differences
                  Test-Most
                  BioPerl
                  Bio-SamTools
                  )

cpan_packages.each do |package_name|
   #installs only if module does not exist
   cpan_client '#{package_name}' do
       install_type 'cpan_module'
       user 'root'
       group 'root'
       version '0'
   end
end

## #installs version or higher
## cpan_client 'CGI' do
##     user 'root'
##     group 'root'
##     version '3.55'
##     install_type 'cpan_module'
##     action 'install'
## end

## # installs exact version of module
## # exact version installation is available only for install from cookbook or from http url
## cpan_client 'http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/CGI.pm-3.59.tar.gz' do
##     user 'root'
##     group 'root'
##     module_name 'CGI'
##     version '=3.59'
##     action 'install'
## end

## cpan_client 'Moose-1.24.tar.gz' do
##     user 'root'
##     group 'root'
##     from_cookbook  'moose'
##     module_name 'Moose'
##     version '=1.24'
##     action 'install'
## end