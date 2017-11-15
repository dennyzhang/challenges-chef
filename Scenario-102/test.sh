#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: test.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2017-11-15>
## Updated: Time-stamp: <2017-11-15 13:51:48>
##-------------------------------------------------------------------
set -e

# https://hub.docker.com/r/chef/chef/
docker pull chef/chef

# Start the a container
export docker_image="chef/chef"
docker stop my-test; docker rm my-test
docker run -t -d --privileged -h mytest --name my-test --entrypoint=/bin/sh "$docker_image"

# curl package should not be installed
docker exec -it my-test which curl

# Run chef to install curl package
# https://www.morethanseven.net/2010/10/30/Chef-hello-world/
sudo chef-solo -c config/solo.rb -j config/node.json
## File: test.sh ends
