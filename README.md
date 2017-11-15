# chef-study: Case study from dummy to pro

[![Build Status](https://travis-ci.org/DennyZhang/chef-study.svg?branch=master)](https://travis-ci.org/DennyZhang/chef-study) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/chef-study/issues) or star [the repo](https://github.com/DennyZhang/chef-study).

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [chef-study](#chef-study)
   * [Scenarios](#scenarios)
      * [Scenario-101: Chef HelloWorld](#scenario-101-chef-helloworld)
      * [Scenario-102: Chef HelloWorld II](#scenario-102-chef-helloworld-ii)
      * [Scenario-103: Enforce TDD For Your Chef Cookbooks](#scenario-103-enforce-tdd-for-your-chef-cookbooks)
      * [Scenario-104: Enforce TDD For Your Chef Cookbooks II](#scenario-104-enforce-tdd-for-your-chef-cookbooks-ii)
      * [Scenario-105: Cluster Deployment Tests For Chef Cookbooks](#scenario-105-cluster-deployment-tests-for-chef-cookbooks)
   * [More Resources](#more-resources)
   * [License](#license)

# Scenarios

## Scenario-101: Chef HelloWorld
- Objective: Get familar with chef.
- Tasks:
```
Start a VM, install chef facility
create a dummy cookbook to install curl package
```

## Scenario-102: Chef HelloWorld II
- Objective: Speed up the chef process via docker image
- Tasks:
```
Based on Scenario-101, start a docker container with chef preinstalled
```

## Scenario-103: Enforce TDD For Your Chef Cookbooks
- Objective: Test your cookbooks
- Tasks:
```
Use kitchen to test your cookbook: start a VM and test the logic
Enforce kitchen verify logic via serverspec
```

## Scenario-104: Enforce TDD For Your Chef Cookbooks II
- Objective: Support test with both VM and docker, thus it can be faster
- Tasks:
```
Based on Scenario-101, test cookbook with both VM and docker
Enforce rubocop for code static check
```

## Scenario-105: Cluster Deployment Tests For Chef Cookbooks
- Objective: Test and verify the deployment for both all-in-one and 2 nodes cluster
- Tasks:
```
Test 2 nodes cluster deployment in docker
```

# More Resources

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).

<img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/magic.gif">
