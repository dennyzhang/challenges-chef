# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: default
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jenkins-demo::conf_jenkins'

service 'jenkins' do
  supports status: true
  action [:enable, :start]
end
