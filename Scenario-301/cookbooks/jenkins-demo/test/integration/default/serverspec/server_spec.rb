# -*- encoding: utf-8 -*-

require 'serverspec'

# Required by serverspec
set :backend, :exec

#############################################################################
# TODO: make the code more general
require 'json'

describe command('java -version') do
  its(:stderr) { should contain '1.8' }
end

describe command('dpkg -l | grep jenkins') do
  its(:stdout) { should contain '2.90' }
end

describe command('chef-solo --version') do
  its(:stdout) { should contain '13.6.4' }
end

%w[8080].each do |port|
  describe port(port) do
    it { should be_listening }
  end
end
