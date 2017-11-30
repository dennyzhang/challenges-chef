[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/challenges-chef/issues) or star [the repo](https://github.com/DennyZhang/challenges-chef).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Requirement](#requirement)
   * [Procedure](#procedure)
   * [More Resources](#more-resources)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# Requirement

1. Deploy a standalone jenkins by chef
2. Chef shall add one jenkins user
3. Chef shall add a dummy job with slack notification enabled
4. Run deployment in docker, vagrant and EC2
5. Test both Ubuntu 14.04 and Centos 7

# Procedure
## Common Setup
- Install bundle
```
apt-get install ruby-dev

ruby --version
# https://github.com/bundler/bundler/issues/4065
sudo gem install bundler -n /usr/local/bin

bundle --version
```

- Install gem depenencies
```
cd cookbooks/jenkins-demo
bundle install
```

## kitchen docker deployment
- Run kitchen test
```
# https://github.com/test-kitchen/kitchen-docker

# Customize this, if you need to enable jenkins slack notification
export SLACK_TOKEN="XXXX"
kitchen list
kitchen test
```

## kitchen digitalocean deployment
```
# https://github.com/test-kitchen/kitchen-digitalocean
cd cookbooks/jenkins-demo
export KITCHEN_YAML=".kitchen_digitalocean.yml"

# Customize this with your credential
export DIGITALOCEAN_ACCESS_TOKEN="1234"
export DIGITALOCEAN_SSH_KEY_IDS="1234, 5678"

# Customize this, if you need to enable jenkins slack notification
export SLACK_TOKEN="XXXX"
kitchen list
kitchen test

- TODO: how does the ssh key work? With which OS user, and where the key is?
```

## kitchen ec2 deployment
- Install AWS cli and configure aws credential
```
# http://docs.aws.amazon.com/cli/latest/userguide/installing.html
pip install awscli
aws configure

# Customize this
export KEY_USER="denny-kitchen-test"
aws ec2 create-key-pair --key-name $KEY_USER | ruby -e "require 'json'; puts JSON.parse(STDIN.read)['KeyMaterial']" > ~/.ssh/$KEY_USER

chmod 600 ~/.ssh/$KEY_USER

export AWS_SSH_KEY_ID="$KEY_USER"
```

- Install and run kitchen-ec2
```
# https://github.com/test-kitchen/kitchen-ec2
# https://github.com/test-kitchen/kitchen-ec2/blob/master/lib/kitchen/driver/ec2.rb
# http://kg4giy.com/2015/12/11/test-kitchen-to-support-amazon-web-service-aws-amis/

cd cookbooks/jenkins-demo
export KITCHEN_YAML=".kitchen_ec2.yml"
# TODO: customize this
export AWS_SSH_KEY_ID="$KEY_USER"

# Update bundle: https://github.com/chef/chef-provisioning/issues/151
bundle update

# Customize this, if you need to enable jenkins slack notification
export SLACK_TOKEN="XXXX"
kitchen list
kitchen test
```

## kitchen vagrant deployment
```
# https://github.com/test-kitchen/kitchen-vagrant
cd cookbooks/jenkins-demo
export KITCHEN_YAML=".kitchen_vagrant.yml"

bundle install

# Customize this, if you need to enable jenkins slack notification
export SLACK_TOKEN="XXXX"
kitchen list
kitchen test
```

# More Resources
- jenkins cookbook: https://github.com/chef-cookbooks/jenkins
<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>
