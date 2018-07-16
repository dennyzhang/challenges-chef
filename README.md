# challenges-chef: Chef Case study from dummy to pro

[![Build Status](https://travis-ci.org/dennyzhang/challenges-chef.svg?branch=master)](https://travis-ci.org/dennyzhang/challenges-chef) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/challenges-chef/issues) or star [the repo](https://github.com/DennyZhang/challenges-chef).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-chef/master/images/chef_icon.png"/> </a>

Table of Contents
=================
Challenges Your Chef Skills By Solving Real Questions.

   * [Scenarios](#scenarios)
      * [Scenario-101: Chef HelloWorld I](#scenario-101-chef-helloworld-i)
      * [Scenario-102: Chef HelloWorld II](#scenario-102-chef-helloworld-ii)
      * [Scenario-103: Chef HelloWorld III](#scenario-103-chef-helloworld-iii)
      * [Scenario-201: Enforce TDD For Your Chef Cookbooks I](#scenario-201-enforce-tdd-for-your-chef-cookbooks-i)
      * [Scenario-202: Enforce TDD For Your Chef Cookbooks II](#scenario-202-enforce-tdd-for-your-chef-cookbooks-ii)
      * [Scenario-301: Use Chef To Deploy Jenkins I](#scenario-301-use-chef-to-deploy-jenkins-i)
      * [Scenario-302: Use Chef To Deploy Jenkins II](#scenario-302-use-chef-to-deploy-jenkins-ii)
      * [Scenario-303: Use Chef To Deploy Jenkins II](#scenario-303-use-chef-to-deploy-jenkins-ii)
      * [Scenario-401: Use Chef To Deploy 2 Nodes Jenkins I](#scenario-401-use-chef-to-deploy-2-nodes-jenkins-i)
   * [Highlights](#highlights)
   * [Contributors: Give People Credits](#contributors-give-people-credits)
   * [License](#license)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

**Similar Challenges**: https://www.dennyzhang.com/battle

# Scenarios

## Scenario-101: Chef HelloWorld I
- Objective: Create a dummy cookbook, and test deployment in docker
- Requirements:
```
1. Use docker container to start a env with chef pre-installed
2. Create a dummy cookbook and apply it
```
- See more: [Scenario-101](./Scenario-101)

## Scenario-102: Chef HelloWorld II
- Objective: Pure VM deployment
- Requirements:
```
1. Start a VM, install chef facility
2. Create a dummy cookbook to install jq package
3. Before install jq, run "apt-get update" by chef. So you need berkshelf.
4. Enforce rubocop and foodcritic for code static check
```
- See more: [Scenario-102](./Scenario-102)

## Scenario-103: Chef HelloWorld III
- Objective: Setup chef server and chef client
- Requirements:
```
1. Start 3 containers to run chef server, knife workstation and chef client
2. Install and configure knife
3. From knife node run chef deployment in chef client node
```
<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-chef/master/images/scenario-103-design.png"/> </a>
- See more: [Scenario-103](./Scenario-103)
- TODO

## Scenario-201: Enforce TDD For Your Chef Cookbooks I
- Objective: Test your cookbooks. Run kitchen docker in your laptop.
- Requirements:
```
1. Use kitchen to test your cookbook: start a container and test the logic
2. Enforce kitchen verify logic via serverspec
```
- See more: [Scenario-201](./Scenario-201)

<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-chef/master/images/scenario-201-design.png"/> </a>
## Scenario-202: Enforce TDD For Your Chef Cookbooks II
- Objective: Deploy for 3 scenarios: docker, local VM and public cloud
- Requirements:
```
1. Use Kitchen to test local vm deployment
2. Use Kitchen to test docker deployment
3. Use Kitchen to test cloud VM deployment
```
- See more: [Scenario-202](./Scenario-202)

<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-chef/master/images/scenario-202-design.png"/> </a>

## Scenario-301: Use Chef To Deploy Jenkins I
- Objective: Use chef to deploy one common service for real
- Requirements:
```
1. Deploy a standalone jenkins by chef
2. Chef shall add one jenkins user
3. Chef shall add a dummy job with slack notification enabled
4. Run deployment in docker, vagrant and EC2
5. Test both Ubuntu 14.04 and Centos 7
```
- See more: [Scenario-301](./Scenario-301)

## Scenario-302: Use Chef To Deploy Jenkins II
- Objective: More Jenkins customization
- Requirements:
```
1. For better security, only registered user can login
2. For better security, Jenkins listen on port 18080, instead of 8080
3. When Jenkins is down, get alerts
```
- See more: [Scenario-302](./Scenario-302)

## Scenario-303: Use Chef To Deploy Jenkins II
- Objective: More Jenkins customization
- Requirements:
```
1. Use Jenkinsfile to create a Jenkins pipeline
2. Enable and configure ThinBackup
```
- See more: [Scenario-303](./Scenario-303)
- TODO

## Scenario-401: Use Chef To Deploy 2 Nodes Jenkins I
- Objective: Test and verify the deployment for both all-in-one and 2 nodes cluster
- Requirements:
```
1. Test 2 nodes jenkins cluster deployment in docker
2. Use Jenkinsfile to configure Jenkins
3. Define Jenkins pipeline
```
<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-chef/master/images/scenario-401-design.png"/> </a>
- See more: [Scenario-303](./Scenario-303)
- TODO

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>

# Highlights
- More Resources:
```
https://github.com/chef-cookbooks/jenkins
https://github.com/jenkinsci/pipeline-examples
```

# Contributors: Give People Credits
Below are folks who have contributed via GitHub!

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).
