- Run code static check via rubocop
```
gem install rubocop -v "0.44.1"
cd cookbooks/example
rubocop .
```
Check more about rubocop: https://www.dennyzhang.com/rubocop_errors

- Run code static check via foodcritic
```
gem install foodcritic -v "4.0.0"
cd cookbooks/
foodcritic example
```

TODO: how to install foodcritic in mac OSX

- Start VM via vagrant
```
vagrant up
```
More about virtualbox: https://www.virtualbox.org/wiki/Downloads

More about vagrant: https://www.vagrantup.com/docs/providers/basic_usage.html

- Login and install chef-dk
```
ssh vagrant@192.168.50.10
# password: vagrant
sudo su -

# https://downloads.chef.io/chefdk
wget -O /tmp/chefdk.deb https://packages.chef.io/files/stable/chefdk/2.3.4/ubuntu/16.04/chefdk_2.3.4-1_amd64.deb
dpkg -i /tmp/chefdk.deb
chef-solo --verison
```

- Upload chef cookbook code
```
scp -r Scenario-102 vagrant@192.168.50.10:/tmp/

```
- Apply Chef update
```
ssh vagrant@192.168.50.10
cd /tmp/Scenario-102

# Before chef deployment, our VM doesn't have jq package
which jq
sudo chef-solo -c config/solo.rb -j config/node.json

# After deployment, we should see jq package installed
which jq
```

- Destroy local vm
```
vagrant destroy
```

- Test in public cloud?

Since you have conquered local VM deployment, it should be easy for you to replicate it in AWS, AZure, etc. Right?
