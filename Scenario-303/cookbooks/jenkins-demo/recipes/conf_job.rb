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
  # keep the gem installation minimal: --no-ri --no-rdoc
  # https://coderwall.com/p/spo6bq/default-no-ri-no-rdoc-on-ruby-gem-installation
  file '/root/.gemrc' do
    content 'gem: --no-ri --no-rdoc'
    mode 0o755
    owner 'root'
    group 'root'
  end

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
    %w[nc gem yum zlib-devel gcc gcc-c++ ruby-devel rubygems].each do |x|
      package x do
        action :install
        # TODO: change this
        # not_if "dpkg -l #{x} | grep -E '^ii'"
      end
    end

    gem_package 'rake' do
      action :install
      version '12.3.0'
    end

    # gem_package 'io-console' do
    #   action :install
    #   version '0.4.6'
    # end
    execute 'Install io-console' do
      command 'gem install io-console'
      action :run
      not_if 'gem list | grep io-console'
    end
  end

  gem_package 'serverspec' do
    action :install
    version '2.41.3'
  end

  cookbook_file '/var/lib/jenkins/script/serverspec_check.sh' do
    source 'serverspec_check.sh'
    mode 0o755
    user 'jenkins'
    group 'jenkins'
  end
end
