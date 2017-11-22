# -*- encoding: utf-8 -*-

#
# Copyright 2017, DennyZhang.com
#
# All rights reserved - Do Not Redistribute
#

default['jenkins_demo']['jenkins_plugins'] = {
  'thinBackup' => '1.9',
  # TODO
  # 'command-launcher' => '1.0',
  'bouncycastle-api' => '2.16.2',
  'credentials' => '2.1.16',
  'plain-credentials' => '1.4',
  'slack' => '2.3',
  'script-security' => '1.35',
  'matrix-auth' => '2.2'
}

########################################
default['jenkins_demo']['default_username'] = ''
default['jenkins_demo']['default_password'] = ''
