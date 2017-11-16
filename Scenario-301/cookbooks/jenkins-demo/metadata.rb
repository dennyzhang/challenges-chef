# -*- encoding: utf-8 -*-

name 'jenkins-demo'
maintainer 'DennyZhang'
maintainer_email 'contact@dennyzhang.com'
license 'All rights reserved'
description 'Setup and configure jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
source_url 'https://www.dennyzhang.com'
issues_url 'https://www.dennyzhang.com'

supports 'ubuntu', '>= 14.04'
depends 'apt', '=2.6.1'
depends 'jenkins', '=5.0.4'

# depends 'apache2', '=3.2.2'
# depends 'ssh', '=0.10.0'
# depends 'build-essential', '=2.4.0'
# depends 'iptables', '=2.1.1'
# depends 'windows', '=1.38.2'
# depends 'yum', '=3.8.1'
# depends 'yum-epel', '=0.6.3'
# depends 'chef_changereport_handler', '=1.0.5'
