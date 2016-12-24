name 'VirusSlayer-chef-cookbooks'
maintainer 'The Authors'
maintainer_email 'davit.bzhalava@ki.se'
license 'all_rights'
description 'Installs/Configures VirusSlayer-chef-cookbooks'
long_description 'Installs/Configures VirusSlayer-chef-cookbooks'
version '0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/davbzh/VirusSlayer-chef-cookbooks/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/VirusSlayer-chef-cookbooks' if respond_to?(:source_url)

depends 'build-essential'
depends 'yum-epel'
depends 'magic_shell'
depends 'perl'
depends 'poise-python'
depends 'cpan'
