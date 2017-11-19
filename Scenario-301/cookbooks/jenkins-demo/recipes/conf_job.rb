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

    # https://www.brightbox.com/blog/2017/01/13/ruby-2-4-ubuntu-packages/
    apt_repository 'ruby-repo' do
      uri 'ppa:brightbox/ruby-ng'
      distribution node['lsb']['codename']
      key 'C3173AA6'
      keyserver 'keyserver.ubuntu.com'
      retries 3
      retry_delay 3
      not_if { ::File.exist?('/etc/apt/sources.list.d/ruby-repo.list') }
    end

    %w[ruby2.4 ruby2.4-dev netcat gem rake].each do |x|
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

  # TODO: keep the gem install minimal: --no-ri --no-rdoc
  gem_package 'serverspec' do
    action :install
    version '2.41.3'
  end
end
