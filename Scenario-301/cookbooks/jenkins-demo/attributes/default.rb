# -*- encoding: utf-8 -*-

default['jenkins_mdm']['repo_server'] = 'repo.carol.ai:18000'
default['jenkins_mdm']['buildrepo_dir'] = '/var/lib/jenkins/code'
default['jenkins_mdm']['avoid_external_network'] = '1'
default['jenkins_mdm']['data_rentention_days'] = '7'

default['jenkins_mdm']['docker_daemon_ip'] = '172.17.0.1'
default['jenkins_mdm']['install_devkit'] = '0'

default['jenkins_mdm']['script_dir'] = \
  '/var/lib/jenkins/code/scripts/devops-knowledgebase'
default['jenkins_mdm']['jenkins_jobs'] = \
  'BuildMDMRepo,UpdateSandboxMDM,UpdateJenkinsItself,TailLogfile'
default['jenkins_plugins'] = {
  'bouncycastle-api' => '2.16.0',
  'junit' => '1.18',
  'script-security' => '1.22',
  'matrix-project' => '1.7.1'
}
