#
# Cookbook:: VirusMeta-chef-cookbooks
# Recipe:: _common
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

# refresh package sources
bash "yum_clean" do
    code "yum clean all"
end

bash "yum_update" do
    code "yum -y update"
end

rhel_packages = %w(zlib-devel
                   bzip2-devel
                   bzip2
                   openssl-devel
                   ncurses-devel
                   sqlite-devel
                   readline-devel
                   tk-devel
                   readline-devel
                   tkinter
                   gcc
                   gcc-c++
                   autoconf
                   automake
                   hg
                   graphviz
                   git
                   texinfo
                   texinfo-tex
                   gnuplot
                   libxslt
                   libxslt-devel
                   libxml2
                   libxml2-devel
                   ImageMagick
                   cmake
                   cpan
                   make
                   gcc
                   python-devel
                   python-nose
                   libpng-devel
                   perl-Time-HiRes
                   gsl-devel
                   libtool
                   tar
                   hdf5-devel
                   )

rhel_packages.each do |package_name|
  bash "yum_install #{package_name}" do
    code "yum -y install #{package_name}"
  end
end

##                    tetex
##                    g++
##                   scrypt

## bash "yum_install" do
##    code "yum -y install zlib-devel bzip2-devel bzip2 openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel readline-devel tkinter gcc gcc-c++ autoconf automake hg graphviz tetex git texinfo texinfo-tex gnuplot libxslt libxslt-devel libxml2 libxml2-devel ImageMagick cmake cpan make gcc g++ python-devel python-nose libpng-devel perl-Time-HiRes gsl-devel libtool scrypt tar yum install hdf5-devel"
## end

## if node['platform_family'] == 'rhel'
##   package ['zlib-devel', 'ncurses-devel'] do
##     action :install
##   end
## end