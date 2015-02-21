# audio book collection manager acceptance tests

This project contains the examples for a blog post about cucumber (which is not
even published at the time of writing).
-------------------------------------------------------------------------------
VM Setup, CentOS minimal, CentOS-7.0-1406-x86_64-Minimal.iso
-------------------------------------------------------------------------------
dhclient
ping google.com
sudo yum update
sudo yum upgrade
sudo yum install git
sudo yum install ruby
sudo gem install bundler
sudo yum install -y gcc ruby-devel zlib-devel
exit
mkdir GitHub
git clone https://github.com/peteriliev/cucumber
cd cucumber
bundle install
gem install actionview
cucumber
