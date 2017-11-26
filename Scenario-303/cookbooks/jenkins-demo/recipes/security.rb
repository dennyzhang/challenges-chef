# -*- encoding: utf-8 -*-

#
# Cookbook Name:: jenkins-demo
# Recipe:: security
#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

require 'openssl'
require 'net/ssh'
# key = OpenSSL::PKey::RSA.new(jenkins['private_key'])
# private_key = key.to_pem
# public_key  = "#{key.ssh_type} #{[key.to_blob].pack('m0')}"

# https://goo.gl/jvn5TN
# Jenkins itself login the server

private_key = node['jenkins_demo']['chef_private_key']
public_key = node['jenkins_demo']['chef_public_key']

# Set the private key on the executor
node.run_state[:jenkins_private_key] = private_key

# Create a default Chef user with the public key
jenkins_user 'chef' do
  full_name   'Chef Client'
  public_keys [public_key]
end

# Turn on basic authentication
jenkins_script 'setup authentication' do
  command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    def instance = Jenkins.getInstance()

    import hudson.security.*
    def realm = new HudsonPrivateSecurityRealm(false)
    instance.setSecurityRealm(realm)

    def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)

    instance.save()
  EOH
  # TODO: add not_if
end

################################################################################
username = node['jenkins_demo']['default_username']
password = node['jenkins_demo']['default_password']
if username != ''
  # Create a dummy user
  # https://gist.github.com/hayderimran7/50cb1244cc1e856873a4
  jenkins_script "add_user #{username}" do
    command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    import hudson.security.*

    def instance = Jenkins.getInstance()

    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount("#{username}", "#{password}")
    instance.setSecurityRealm(hudsonRealm)
    instance.save()
    EOH
    not_if "test -d /var/lib/jenkins/users/#{username}"
  end
end

# Use matrix authorization model
# Gives all authenticated users admin access
# https://github.com/glenjamin/jenkins-groovy-examples/blob/master/README.md
jenkins_script 'all authenticated users admin access' do
  command <<-EOH.gsub(/^ {4}/, '')
  import jenkins.model.*
  def instance = Jenkins.getInstance()

  import hudson.security.*
  def realm = new HudsonPrivateSecurityRealm(false)
  instance.setSecurityRealm(realm)

  def strategy = new hudson.security.GlobalMatrixAuthorizationStrategy()
  strategy.add(Jenkins.ADMINISTER, 'authenticated')
  instance.setAuthorizationStrategy(strategy)

  instance.save()
  EOH
  # TODO: add not_if
end
