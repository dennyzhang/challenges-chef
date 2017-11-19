# -*- encoding: utf-8 -*-

require 'serverspec'

# Required by serverspec
set :backend, :exec

#############################################################################
require 'json'

describe command('java -version') do
  its(:stderr) { should contain '1.8' }
end

describe command('chef-solo --version') do
  its(:stdout) { should contain '13.6.4' }
end

%w[8080].each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

if os[:family] == 'redhat'
  describe command('yum info jenkins') do
    its(:stdout) { should contain '2.73.3' }
  end
elsif %w[debian ubuntu].include?(os[:family])
  # debian related environment spec
  describe command('dpkg -l | grep jenkins') do
    its(:stdout) { should contain '2.90' }
  end
end
