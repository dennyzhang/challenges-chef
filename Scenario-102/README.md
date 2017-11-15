# Start docker-compose env
docker-compose up -d

# Login to the container, and run procedure
```
docker exec -it my_chef sh
apt-get -y update

cd /tmp

# Before chef apply, lsof package is missing
which lsof

# From config/node.json, we specify to apply example cookbook
chef-solo -c config/solo.rb -j config/node.json

# After chef apply, lsof package is installed
which lsof
```