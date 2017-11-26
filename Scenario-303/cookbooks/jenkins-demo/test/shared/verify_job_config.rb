# -*- encoding: utf-8 -*-

require 'serverspec'

# Required by serverspec
set :backend, :exec
# https://github.com/test-kitchen/test-kitchen/issues/469
set :path, '/sbin:/usr/local/sbin:/usr/local/bin:$PATH'

#############################################################################
describe file('/var/lib/jenkins/script/serverspec_check.sh') do
  it { should be_file }
end

describe command('which nc') do
  its(:exit_status) { should eq 0 }
end

describe command('gem list | grep serverspec') do
  its(:stdout) { should contain '2.41.3' }
end

if %w[redhat centos].include?(os[:family])
  describe command('gem --version') do
    its(:stdout) { should contain '2.0.14' }
  end

  describe command('rake --version') do
    its(:stdout) { should contain '12.3.0' }
  end
elsif %w[debian ubuntu].include?(os[:family])
  # debian related environment spec
  describe command('gem --version') do
    its(:stdout) { should contain '2.6.13' }
  end

  describe command('rake --version') do
    its(:stdout) { should contain '10.0.4' }
  end
end

# verify plugin version
describe file('/var/lib/jenkins/plugins/workflow-cps/META-INF/MANIFEST.MF') do
  its(:content) { should contain 'Plugin-Version: 2.41' }
end

describe file('/var/lib/jenkins/plugins/git/META-INF/MANIFEST.MF') do
  its(:content) { should contain 'Plugin-Version: 3.6.4' }
end

describe file('/var/lib/jenkins/plugins/workflow-job/META-INF/MANIFEST.MF') do
  its(:content) { should contain 'Plugin-Version: 2.9' }
end

describe file('/var/lib/jenkins/plugins/workflow-support/META-INF/MANIFEST.MF') do
  its(:content) { should contain 'Plugin-Version: 2.16' }
end
