- Get chef image for binaries and libraries

https://hub.docker.com/r/chef/chef/
```
docker pull chef/chef
```

- Start chef container
```
export docker_image="chef/chef"
docker stop my-test; docker rm my-test
docker run -t -d --privileged -h mytest --name my-test --entrypoint=/bin/sh "$docker_image"

docker exec -it my-test bash

which curl
```

- start helloworld

https://www.morethanseven.net/2010/10/30/Chef-hello-world/

Get example chef code
```
apk add --update git

mkdir /tmp/chef_test
cd /tmp/chef_test
git clone https://github.com/DennyZhang/dennytest.git
cd dennytest/chef_helloworld
```

Apply example cookbook
```
sudo chef-solo -c config/solo.rb -j config/node.json

which curl
```
