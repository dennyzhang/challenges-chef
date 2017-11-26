# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: test_pipeline
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#
################################################################################
# Install Jenkins pipeline plugins

package 'git' do
  action :install
end

jenkins_pipeline_plugins = {
  ############################################
  # Install git plugin
  'git' => '3.6.4',
  # upgrade or downgrade plugins
  'structs' => '1.10',
  'git-client' => '2.6.0',
  'scm-api' => '2.2.5',
  ############################################
  # Install pipeline plugin
  'workflow-aggregator' => '2.5',
  # upgrade or downgrade plugins
  'workflow-step-api' => '2.14',
  'branch-api' => '2.0.15',
  # Need to install branch-api, then cloudbees-folder
  # If not, branch-api:v2.0.15 will downgrade cloudbees-folder to v6.1.0
  'cloudbees-folder' => '6.2.1',
  'workflow-cps' => '2.41',
  'workflow-support' => '2.16'
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
