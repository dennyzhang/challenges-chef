[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Requirements](#requirements)
   * [Procedures](#procedures)

- TODO

<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns.png"></a>

# Requirements
1. Start chef server in one container
2. Setup chef client in another container
3. Apply dummy cookbook in chef client node

# Procedures
- Start docker-compose env
docker-compose up -d

- Setup chef server in chef_server container
```
docker exec -it chef_server bash
# install chef server
wget -O /tmp/chef-server-core_12.17.5-1_amd64.deb \
     https://packages.chef.io/files/stable/chef-server/12.17.5/ubuntu/14.04/chef-server-core_12.17.5-1_amd64.deb

dpkg -i /tmp/chef-server-core_*.deb

# https://hub.docker.com/r/base/chef-server/~/dockerfile/
which chef-server-ctl

dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl
sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184

nohup /opt/opscode/embedded/bin/runsvdir-start &

chef-server-ctl reconfigure
```

- Use chef_client as both client and knife workstation

- Configure knife workstation
```
docker exec -it chef_client bash

cat > ~/.ssh/knife.rb <<EOF
log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '/Users/mac/.chef/admin.pem'
validation_client_name   'digitalocean-validator'
validation_key           '/Users/mac/.chef/digitalocean-validator.pem'
chef_server_url          'https://chef_server/organizations/digitalocean'
syntax_check_cache_path  '/Users/mac/.chef/syntax_check_cache'
ssl_verify_mode :verify_none
EOF
```

- Upload chef cookbook
```
```

- Use knife to run deployment
```
docker exec -it chef_client bash
```

- Destroy docker-compose env after testing
```
docker-compose down -v
```
<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns.png"></a>
