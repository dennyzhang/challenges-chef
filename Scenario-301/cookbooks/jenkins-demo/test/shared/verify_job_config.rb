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
  describe command('nc -version') do
    its(:stderr) { should contain '6.40' }
  end

  describe command('gem --version') do
    its(:stdout) { should contain '2.0.14' }
  end

  describe command('rake --version') do
    its(:stdout) { should contain '0.9.6' }
  end

  describe command('gem list | grep serverspec') do
    its(:stdout) { should contain '2.41.3' }
  end
end
