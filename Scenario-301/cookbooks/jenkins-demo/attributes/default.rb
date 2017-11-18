# -*- encoding: utf-8 -*-

default['jenkins_plugins'] = {
  'thinBackup' => '1.9',
  'slack' => '2.3'
}

default['jenkins_demo']['jenkins_jobs'] = 'TailLogfile'
