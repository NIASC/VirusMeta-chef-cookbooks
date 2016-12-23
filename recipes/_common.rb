#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: _common
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

# refresh package sources
bash "yum_clean" do
    code "yum update"
end

bash "yum_update" do
    code "yum update"
end

bash "yum_install" do
    code "yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel readline-devel tkinter gcc gcc-c++ autoconf automake hg graphviz tetex git texinfo texinfo-tex gnuplot libxslt libxslt-devel libxml2 libxml2-devel ImageMagick cmake cpan make gcc g++ python-devel python-nose libpng-devel perl-Time-HiRes gsl-devel libtool scrypt"
end