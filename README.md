# chef-study: Case study from dummy to pro

[![Build Status](https://travis-ci.org/DennyZhang/chef-study.svg?branch=master)](https://travis-ci.org/DennyZhang/chef-study) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [chef-study](#chef-study)
   * [Scenarios](#scenarios)
      * [Scenario-101: Chef HelloWorld I](#scenario-101-chef-helloworld-i)
      * [Scenario-102: Chef HelloWorld II](#scenario-102-chef-helloworld-ii)
      * [Scenario-103: Chef HelloWorld III](#scenario-103-chef-helloworld-iii)
      * [Scenario-104: Enforce TDD For Your Chef Cookbooks](#scenario-104-enforce-tdd-for-your-chef-cookbooks)
      * [Scenario-105: Enforce TDD For Your Chef Cookbooks II](#scenario-105-enforce-tdd-for-your-chef-cookbooks-ii)
      * [Scenario-106: Cluster Deployment Tests For Chef Cookbooks](#scenario-106-cluster-deployment-tests-for-chef-cookbooks)
   * [More Resources](#more-resources)
   * [Contributors: Give people credits](#contributors-give-people-credits)
   * [License](#license)

# Scenarios

## Scenario-101: Chef HelloWorld I
- Objective: Create a dummy cookbook, and test it in docker
- Tasks:
```
Use docker container to start a env with chef pre-installed
Create a dummy cookbook and apply it
```
- See more: [Scenario-101](./Scenario-101)

## Scenario-102: Chef HelloWorld II
- Objective: Pure VM deployment
- Tasks:
```
Start a VM, install chef facility
create a dummy cookbook to install jq package
Before install jq, run "apt-get update" by chef. So you need berkshelf.
Enforce rubocop and foodcritic for code static check
```
- See more: [Scenario-102](./Scenario-102)

## Scenario-103: Chef HelloWorld III
- Objective: Setup chef server and chef client
- Tasks:
```
Start 2 container: chef server and chef client
Install Jenkins in chef client node
```
- See more: [Scenario-103](./Scenario-103)

## Scenario-104: Enforce TDD For Your Chef Cookbooks
- Objective: Test your cookbooks
- Tasks:
```
Use kitchen to test your cookbook: start a VM and test the logic
Enforce kitchen verify logic via serverspec
```
- See more: [Scenario-104](./Scenario-104)

## Scenario-105: Enforce TDD For Your Chef Cookbooks II
- Objective: Support test with both VM and docker, thus it can be faster
- Tasks:
```
Based on Scenario-104, test cookbook with both VM and docker
```
- See more: [Scenario-105](./Scenario-105)

## Scenario-106: Cluster Deployment Tests For Chef Cookbooks
- Objective: Test and verify the deployment for both all-in-one and 2 nodes cluster
- Tasks:
```
Test 2 nodes cluster deployment in docker
```
- See more: [Scenario-106](./Scenario-106)

# More Resources

# Contributors: Give people credits
Below are folks who have contributed via GitHub!

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).

<img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/magic.gif">
