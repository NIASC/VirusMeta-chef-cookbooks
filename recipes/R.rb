#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: R
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

packages = %w(
      blas
      lapack
      blas-devel
      lapack-devel
      texinfo-tex
      R
      )

packages.each do |package_name|
  bash "yum_install" do
    code "yum -y install #{package_name}"
    retries 1
  end
end
