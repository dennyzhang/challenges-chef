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

# TODO: change this
private_key = '-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA6fIwUKxZXgKqEE6HCM94eEEeQ+n9mGpKn+CiKExI97mQtio4
uzB/4A7qVXfBYaa2jbPZzD6bDvGco88vgeDuRB5tNh/sRBD3T7L9CxNIGp9gMMsu
tRprwI5MEUsDDFXMKo5ZinpRe9fud5UBOmEHK0vjRVSgLVCGYdv/iXaBKY3feH8a
4gUuTzkdbUtoUMAUTfNyevhUfLRKSWjr5+f7krYYTqJpM7KUAL9e2dYMjkj3He7g
iM4uiPtAQnMYcsyevNgpM0uKnp6+pPzTMSkSNp3uIK6aQ4lR80lEfq8fRwqzsIuJ
dRT/+iJpd6XF8+GSyOt/tEh1RPiEKiGHLpmZGQIDAQABAoIBAQDFsipuIhcrQKki
OpoWMe0mAjFnRtdM85W4YYXm9AA9h4zow+lJFoUZfME+FINQ2CcwvClzVfyGtlqe
ezk0UjZHTkcQFA3+vy+fJCx+LX8jMEeDNFB2Lqub/yP9ARzEUcTEuaKlSRSOyTz1
xO9SvCfoyKp4Ljll0cSd8eGR8pjX2TSfJ85aFAcP1CHGa/qGdxhSrbL2PMXaNFIT
27ZEUo4FVqcwRFN6JuO4sAlnyg8axXlXNLpwPzW1Zi7auS9nAO9bDEIhP4YfFwWs
/iV7KBs/bryez94XS68b3MUXoZWS+1nP8ivBSOCH0mWy5/PhR4esih2EhXk/hi3P
dp6aX4p5AoGBAPrmS+4lrvnvk2EOj3vqSergd31XBTM6NRKSsIYCtlaXsVjMym/i
UdqcLqha4IEW3mucmpD3MBsTqshHGTI+67+tU/G23kThV/3U3a+jSR10FjgACPRd
8VhxrhTBvKjcw0uKeMl9uE0eb/2q8uVtX/8InOCvEfNGFCcszLsYFBr3AoGBAO6z
qhWt8y/HkqWgBcbDJKx+T050nM9fkkBk1ILZn/GMEU828aEvKSwa8wzcx1gPo8Uu
TP2SS0K0vnQv75UfyafgxFMVlELQrRTLHJqFQrCGikgBLNwHjRdvHfNujoBXbv+9
g4LVFqHv0/kVRc1kXhdEwBCZm29rCDVusKK0C1hvAoGBAOAY4qkLL4Y93j1KbA4Z
7XvEkfV5zEM9Mjosm06XDZW6V8Ug5Y+ZbdL8vQ/SW8PxUSh87/GbV3RX1KqeFnsy
iA7kGZ5D37NWMumdP4SpK50LGu1Z2qWpYu/EWeBgSsnopObL/6a4i+0VyqGgFuOl
FaENaFGnDTlk1otHEHXrw8lxAoGBAITL11fwSlbOhLs3537ImeKM8roHDiYgWVER
x1h0khLjhc24F31Aq3sqEwWY3h4TtVzBgXugo9Ycj8g70uH3qUyIMzC11KHHTkM/
LE6azJtAfjXI0Zgna0saOmNvoj+sZMhKOpvSyKCWuCrettKpf98aFHAnxN2bghmX
1xTtbVJpAoGBAKnqvADsNFaI1Ak7tdfJJ+chxnxXd1k6Mly44Jsp6oako4Nl2Uiw
3xL4JGed+QBmjFh+n4hR9T7J65fUFvBixBEAhDSXcRHWL84xTQWLtdHK4+zDWGJt
n2DMrFzhp1H6neUFMBeNOw+fQuhPj6OcLrs4dRdyQhVRp0ZOJyLMS39e
-----END RSA PRIVATE KEY-----'

public_key = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDp8jBQrFleAqoQTocIz3h4QR5D6f2Yakqf4KIoTEj3uZC2Kji7MH/gDupVd8FhpraNs9nMPpsO8Zyjzy+B4O5EHm02H+xEEPdPsv0LE0gan2Awyy61GmvAjkwRSwMMVcwqjlmKelF71+53lQE6YQcrS+NFVKAtUIZh2/+JdoEpjd94fxriBS5POR1tS2hQwBRN83J6+FR8tEpJaOvn5/uSthhOomkzspQAv17Z1gyOSPcd7uCIzi6I+0BCcxhyzJ682CkzS4qenr6k/NMxKRI2ne4grppDiVHzSUR+rx9HCrOwi4l1FP/6Iml3pcXz4ZLI63+0SHVE+IQqIYcumZkZ mac@Denny-mac.local'

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
    # TODO
    # not_if "test -d /var/lib/jenkins/users/#{username}"
  end

  # TODO
  # Logged-in users can do anything. But don't allow anonymous read access
end
