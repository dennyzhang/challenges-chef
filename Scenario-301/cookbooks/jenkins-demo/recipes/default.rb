# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: default
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'
include_recipe 'jenkins-demo::master'

%w[lsof].each do |x|
  package x do
    action :install
    not_if "dpkg -l #{x} | grep -E '^ii'"
  end
end
