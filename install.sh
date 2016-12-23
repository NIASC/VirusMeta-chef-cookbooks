cd ~/workspace/
chef generate cookbook VirusSlayer-chef-cookbooks

scp -r /Users/davbzh/workspace/VirusSlayer-chef-cookbooks root@192.168.56.113:.
#on server side
wget https://packages.chef.io/files/stable/chefdk/1.1.16/el/7/chefdk-1.1.16-1.el7.x86_64.rpm
yum install chefdk-1.1.16-1.el7.x86_64.rpm
cd VirusSlayer-chef-cookbooks/
berks vendor cookbooks
chef-client -z -o VirusSlayer-chef-cookbooks
