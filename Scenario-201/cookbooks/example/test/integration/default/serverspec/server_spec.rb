# -*- encoding: utf-8 -*-

require 'serverspec'
require 'socket'
require 'json'

# Required by serverspec
set :backend, :exec

chef_data = JSON.parse(IO.read('/tmp/kitchen/dna.json'))

update_version = \
  chef_data.fetch('example').fetch('update_version')

describe command('cat /etc/ec2-user/version.txt') do
  its(:stdout) { should contain update_version }
end
