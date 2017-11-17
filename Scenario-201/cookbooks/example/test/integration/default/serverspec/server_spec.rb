# -*- encoding: utf-8 -*-

require 'serverspec'
require 'socket'
require 'json'

# Required by serverspec
set :backend, :exec

chef_data = JSON.parse(IO.read('/tmp/kitchen/dna.json'))

update_version = \
  chef_data.fetch('example').fetch('update_version')

# TODO: verify the specific version '1.5-1-a5b5cbe'
describe package('jq') do
  it { should be_installed }
end

describe command('cat /etc/ec2-user/version.txt') do
  its(:stdout) { should contain update_version }
end
