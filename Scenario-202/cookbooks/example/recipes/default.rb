# -*- encoding: utf-8 -*-

#
# Cookbook Name:: example
# Recipe:: default
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

%w(jq).each do |x|
  package 'jq' do
    action :install
    not_if "dpkg -l #{x} | grep -E '^ii'"
  end
end

directory '/etc/ec2-user/' do
  owner 'root'
  group 'root'
  mode 0o755
  action :create
end

template '/etc/ec2-user/version.txt' do
  source 'version.txt.erb'
  mode 0o700
end
