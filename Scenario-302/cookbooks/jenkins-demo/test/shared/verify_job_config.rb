# -*- encoding: utf-8 -*-

require 'serverspec'

# Required by serverspec
set :backend, :exec

#############################################################################
require 'json'

chef_data = JSON.parse(IO.read('/tmp/kitchen/dna.json'))
jenkins_jobs = \
  chef_data.fetch('jenkins_demo').fetch('jenkins_jobs')

if jenkins_jobs.index('CommonServerCheckRepo')

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

end
