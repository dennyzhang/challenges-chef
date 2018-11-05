[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/challenges-chef/issues) or star [the repo](https://github.com/DennyZhang/challenges-chef).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Requirements](#requirements)
   * [Procedure](#procedure)

<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/dennyzhang/challenges-chef/master/images/scenario-101-screenshot.jpg"/> </a>
<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# Requirements
```
1. Use docker container to start a env with chef pre-installed
2. Create a dummy cookbook and apply it
```

# Procedure

- Start docker-compose env

docker-compose up -d

- Login to the container, and run procedure
```
docker exec -it my_chef sh
apt-get -y update

cd /tmp

- Before chef apply, jq package is missing
which jq

- From config/node.json, we specify to apply example cookbook
chef-solo -c config/solo.rb -j config/node.json

- After chef apply, jq package is installed
which jq
```

- Destroy docker-compose env after testing

```
docker-compose down -v
```
<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>
