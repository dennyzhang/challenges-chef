# Run apt-get update first
include_recipe 'apt::default'

package 'jq' do
  action :install
  not_if "dpkg -l #{x} | grep -E '^ii'"  
end

template '/etc/ec2-user/version.txt' do
  source 'version.txt.erb'
  mode 0o700
end
