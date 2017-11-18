[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Requirements](#requirements)
   * [Procedures](#procedures)

![scenario-103-design.png](../images/scenario-103-design.png)

<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns.png"></a>

# Requirements
1. Start 3 containers to run chef server, knife and chef client
2. Install and configure knife
3. From knife node run chef deployment in chef client node

# Procedures
- Start docker-compose env
```
docker-compose up -d
docker-compose ps
```

- Setup chef server in docker container

In docker-compose.yml, chef_server is using a dedicated chef server image.

```
# https://hub.docker.com/r/base/chef-server/~/dockerfile/

# Verify chef server
curl -k -I https://localhost/users/login
```

- Use chef_client as both client and knife workstation

- Get certificate from chef server to chef knife

To configure knife, we need admin.pem and chef-validator.pem from chef server node

```
docker cp chef_server:/etc/chef-server/admin.pem /tmp/admin.pem
docker cp chef_server:/etc/chef-server/chef-validator.pem /tmp/chef-validator.pem

docker cp /tmp/admin.pem chef_knife:/tmp/
docker cp /tmp/chef-validator.pem chef_knife:/tmp/

rm -rf /tmp/admin.pem /tmp/chef-validator.pem
```

- Configure knife workstation
```
docker exec -it chef_knife bash

mkdir -p /root/chef-server/.chef
mv /tmp/*.pem /root/chef-server/
chmod 600 -R /root/chef-server/*.pem
ls -lth /root/chef-server/

which knife

curl -k -I https://chef_server/organizations/digitalocean

knife configure --initial

# Please enter the chef server URL:
# https://chef_server/organizations/myorg
#
# Please enter a name for the new user:
# dennykitchen
#
# Please enter a password for the new user:
# password1
#

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
docker exec -it chef_client bash
knife upload
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
