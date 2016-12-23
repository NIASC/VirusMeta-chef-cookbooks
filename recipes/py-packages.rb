#
# Cookbook:: VirusSlayer-chef-cookbooks
# Recipe:: py-packages
#
# Copyright (c) 2016 Davit Bzhalava, All Rights Reserved.

include_recipe 'build-essential'
include_recipe 'yum-epel'
package "python-pip"

pip_packages = %w(
        biopython
        paired_sequence_utils
        xmlutils
        numpy
        matplotlib
        scipy
        scikit-learn
        rpy2
        ruffus
        ete2
        hcluster
        pandas
        pbs
        sh
        argparse
        pyfasta
        https://pypi.python.org/packages/3.4/s/setuptools/setuptools-3.4.1-py2.py3-none-any.whl
     )

pip_packages.each do |package_name|
  bash "install_py-packages" do
    code "pip install #{package_name}"
    retries 1
  end
end