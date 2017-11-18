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
      * [Scenario-201: Enforce TDD For Your Chef Cookbooks I](#scenario-201-enforce-tdd-for-your-chef-cookbooks-i)
      * [Scenario-202: Enforce TDD For Your Chef Cookbooks II](#scenario-202-enforce-tdd-for-your-chef-cookbooks-ii)
      * [Scenario-301: Use Chef To Deploy Jenkins I](#scenario-301-use-chef-to-deploy-jenkins-i)
      * [Scenario-302: Use Chef To Deploy Jenkins II](#scenario-302-use-chef-to-deploy-jenkins-ii)
      * [Scenario-303: Use Chef To Deploy Jenkins II](#scenario-303-use-chef-to-deploy-jenkins-ii)
   * [More Resources](#more-resources)
   * [Contributors: Give People Credits](#contributors-give-people-credits)
   * [License](#license)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

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
1. Start 3 containers to run chef server, knife and chef client
2. Install and configure knife
3. From knife node run chef deployment in chef client node
```
- See more: [Scenario-103](./Scenario-103)
- TODO

![scenario-103-design.png](./images/scenario-103-design.png)

## Scenario-201: Enforce TDD For Your Chef Cookbooks I
- Objective: Test your cookbooks. Run kitchen docker in your laptop.
- Requirements:
```
1. Use kitchen to test your cookbook: start a container and test the logic
2. Enforce kitchen verify logic via serverspec
```
- See more: [Scenario-201](./Scenario-201)

![scenario-201-design.png](./images/scenario-201-design.png)

## Scenario-202: Enforce TDD For Your Chef Cookbooks II
- Objective: Deploy for 3 scenarios: docker, local VM and public cloud
- Requirements:
```
1. Use Kitchen to test local vm deployment
2. Use Kitchen to test docker deployment
3. Use Kitchen to test cloud VM deployment
```
- See more: [Scenario-202](./Scenario-202)

![scenario-202-design.png](./images/scenario-202-design.png)

## Scenario-301: Use Chef To Deploy Jenkins I
- Objective: Use chef to deploy one common service for real
- Requirements:
```
1. Deploy a standalone jenkins by chef
2. Chef shall add one jenkins user
3. Chef shall add a dummy job with slack notification enabled
4. Run deployment in docker, vagrant and EC2
```
- See more: [Scenario-301](./Scenario-301)
- TODO

## Scenario-302: Use Chef To Deploy Jenkins II
- Objective: More Jenkins customization
- Requirements:
```
1. For better security, listen Jenkins on port 18080, instead of 8080
2. Verify the Jenkins deployment
3. Use EC2 to deploy jenkins
4. Enable nagios monitoring and slack notification
5. Enable and configure ThinBackup
```
- See more: [Scenario-302](./Scenario-302)
- TODO

## Scenario-303: Use Chef To Deploy Jenkins II
- Objective: Test and verify the deployment for both all-in-one and 2 nodes cluster
- Requirements:
```
1. Test 2 nodes jenkins cluster deployment in docker
2. Verify the deployment
3. Support deploy to both docker and EC2
```
- See more: [Scenario-303](./Scenario-303)
- TODO

<a href="https://www.dennyzhang.com"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/magic.gif"></a>

# More Resources

# Contributors: Give People Credits
Below are folks who have contributed via GitHub!

- Ming Zhang: [![LinkedIn](https://www.dennyzhang.com/wp-content/uploads/sns/linkedin.png)](https://www.linkedin.com/in/blackmagic02881/)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).
