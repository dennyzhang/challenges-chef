# -*- encoding: utf-8 -*-

default['jenkins_plugins'] = {
  'thinBackup' => '1.9',
  'command-launcher' => '1.1',
  'bouncycastle-api' => '2.16.2',
  'credentials' => '2.1.16',
  'plain-credentials' => '1.4',
  'slack' => '2.3'
}

default['jenkins_demo']['jenkins_jobs'] = 'TailLogfile'
