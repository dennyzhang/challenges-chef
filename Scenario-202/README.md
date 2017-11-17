[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Requirements](#requirements)
   * [Procedure](#procedure)
      * [Common Setup](#common-setup)
      * [kitchen docker deployment](#kitchen-docker-deployment)
      * [kitchen digitalocean deployment](#kitchen-digitalocean-deployment)
      * [kitchen ec2 deployment](#kitchen-ec2-deployment)
      * [kitchen vagrant deployment](#kitchen-vagrant-deployment)

![scenario-202-design.png](../images/scenario-202-design.png)

<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns.png"></a>

# Requirements
1. Use Kitchen to test local vm deployment
2. Use Kitchen to test docker deployment
3. Use Kitchen to test cloud VM deployment

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
cd cookbooks/example
bundle install
```

## kitchen docker deployment
- Run kitchen test
```
# https://github.com/test-kitchen/kitchen-docker
kitchen converge
kitchen list
kitchen verify
kitchen destroy
```

## kitchen digitalocean deployment
```

```
## kitchen ec2 deployment
## kitchen vagrant deployment

<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns.png"></a>
