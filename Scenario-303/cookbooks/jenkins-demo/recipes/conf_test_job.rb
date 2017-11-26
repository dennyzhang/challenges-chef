# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: conf_test_job
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#
# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: conf_test_job
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

################################################################################
# Install simple jobs
%w[CommonServerCheckRepo].each do |job_name|
  config = File.join(Chef::Config[:file_cache_path], "#{job_name}.xml")
  template config do
    source "#{job_name}/config.xml"
  end

  jenkins_job job_name do
    config config
  end
end

# Install facilities related to the jobs

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

  # TODO: better way to install io-console gem
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
################################################################################
# Install Jenkins pipeline plugins

package 'git' do
  action :install
end

jenkins_pipeline_plugins = {
  # Install git plugin
  'structs' => '1.10',
  'git-client' => '2.6.0',
  'scm-api' => '2.2.5',
  'git' => '3.6.4',
  # Install pipeline plugin
  'workflow-step-api' => '2.14',
  'workflow-support' => '2.16',
  'cloudbees-folder' => '6.2.1',
  'branch-api' => '2.0.15',
  'workflow-cps' => '2.41',
  'workflow-aggregator' => '2.5'
}

jenkins_pipeline_plugins.each do |plugin|
  jenkins_plugin plugin[0] do
    version plugin[1]
    notifies :execute, 'jenkins_command[safe-restart]', :delayed
  end
end

# force restart, since critical jenkins plugin installed
jenkins_command 'safe-restart' do
  action :execute
end

%w[JenkinsFileExample1 JenkinsFileExample2].each do |job_name|
  config = File.join(Chef::Config[:file_cache_path], "#{job_name}.xml")
  template config do
    source "#{job_name}/config.xml"
  end

  jenkins_job job_name do
    config config
  end
end
################################################################################
