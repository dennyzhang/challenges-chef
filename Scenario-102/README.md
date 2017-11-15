[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Start VM via vagrant](#start-vm-via-vagrant)
   * [Login and install chef-dk](#login-and-install-chef-dk)
   * [Upload chef cookbook code](#upload-chef-cookbook-code)
   * [Get cookbooks dependency](#get-cookbooks-dependency)
   * [Apply Chef update](#apply-chef-update)
   * [Run code static check](#run-code-static-check)
   * [Destroy local vm](#destroy-local-vm)
   * [Test in public cloud?](#test-in-public-cloud)

# Start VM via vagrant
```
vagrant up
```
More about virtualbox: https://www.virtualbox.org/wiki/Downloads

More about vagrant: https://www.vagrantup.com/docs/providers/basic_usage.html

# Login and install chef-dk
```
ssh vagrant@192.168.50.10
# password: vagrant

# https://downloads.chef.io/chefdk
wget -O /tmp/chefdk.deb \
     https://packages.chef.io/files/stable/chefdk/2.3.4/ubuntu/16.04/chefdk_2.3.4-1_amd64.deb

sudo dpkg -i /tmp/chefdk.deb

# chef-solo version: 13.4.19
chef-solo -verison
```

# Upload chef cookbook code
```
scp -r Scenario-102 vagrant@192.168.50.10:/tmp/
```

# Get cookbooks dependency
```
ssh vagrant@192.168.50.10
cd /tmp/Scenario-102/cookbooks/example/
berks install
```

# Apply Chef update
```
ssh vagrant@192.168.50.10
cd /tmp/Scenario-102

# Before chef deployment, our VM doesn't have jq package
which jq
sudo chef-solo -c config/solo.rb -j config/node.json

# After deployment, we should see jq package installed
which jq
```

# Run code static check
- rubocop
```
gem install rubocop -v "0.44.1"
cd cookbooks/example
rubocop .
```
Check more about rubocop: https://www.dennyzhang.com/rubocop_errors

- foodcritic
```
gem install foodcritic -v "4.0.0"
cd cookbooks/
foodcritic example
```

TODO: how to install foodcritic in mac OSX

# Destroy local vm
```
vagrant destroy
```

# Test in public cloud?

Since you have conquered local VM deployment, it should be easy for you to replicate it in AWS, AZure, etc. Right?
