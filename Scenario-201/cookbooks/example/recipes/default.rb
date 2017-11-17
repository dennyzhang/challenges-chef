# Run apt-get update first
include_recipe 'apt::default'

describe package('jq') do
  it { should be_installed }
end

template '/etc/ec2-user/version.txt' do
  source 'version.txt.erb'
  mode 0o700
end
