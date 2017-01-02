# directories to be created
default.dir.software = "/opt/software"
default.dir.archive  = "/opt/archive"
default.dir.jar      = "#{default.dir.software}/jar"
default.dir.data     = "/opt/data"
default.dir.etc      = "/usr/local/etc"

# directories existent by default
default.dir.bin      = "/usr/bin"

# diginorm
default['VirusMeta-chef-cookbooks']['khmer_githuburl'] = "https://github.com/dib-lab/khmer.git"
default['VirusMeta-chef-cookbooks']['screed_githuburl'] = "https://github.com/dib-lab/screed.git"

# BLAST
default['blast']['version'] = '2.5.0'
default['blast']['install_path'] = '/usr/bin'
default['blast']['dir'] = default['blast']['install_path'] + '/' + 'blast-' + default['blast']['version']
default['blast']['rpm_filename'] = "ncbi-blast-#{node['blast']['version']}+-5.x86_64.rpm"
default['blast']['linux_filename'] = "ncbi-blast-#{node['blast']['version']}+-x64-linux.tar.gz"
default['blast']['url'] = 'ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/'

# BWA
default['bwa']['version'] = '0.7.15'
default['bwa']['filename'] = "bwa-#{node['bwa']['version']}.tar.bz2"
default['bwa']['url'] = "http://sourceforge.net/projects/bio-bwa/files/#{node['bwa']['filename']}"
default['bwa']['install_path'] = '/usr/local/src'
default['bwa']['dir'] = default['bwa']['install_path'] + '/' + 'bwa-' + default['bwa']['version']
default['bwa']['bin_path'] = '/usr/bin'

# Samtools
default['Samtools']['version'] = '1.3'
default['Samtools']['install_path'] = '/usr/local/src'
default['Samtools']['make_options'] = ''

# Cdhit
default['cdhit']['version'] = 'v4.6.1-2012-08-27'
default['cdhit']['install_path'] = '/usr/local/src'
default['cdhit']['make_options'] = ''
