# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: conf_job
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

jenkins_jobs = node['jenkins_demo']['jenkins_jobs']

# Install Jenkins jobs 
jenkins_jobs.split(',').each do |job_name|
  config = File.join(Chef::Config[:file_cache_path], "#{job_name}.xml")

  template config do
    source "#{job_name}/config.xml"
  end

  # Create a jenkins job (default action is `:create`)
  jenkins_job job_name do
    config config
  end
end

# Install required facilities
if jenkins_jobs.index('CommonServerCheckRepo')
  if platform_family?('debian')
    %w[nc gem rake].each do |x|
      package x do
        action :install
        not_if "dpkg -l #{x} | grep -E '^ii'"
      end
    end
  else
    %w[nc gem rake].each do |x|
      package x do
        action :install
        # TODO: change this
        # not_if "dpkg -l #{x} | grep -E '^ii'"
      end
    end
  end
end
