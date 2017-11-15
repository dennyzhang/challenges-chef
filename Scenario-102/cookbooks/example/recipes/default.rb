# Run apt-get update first
include_recipe 'apt::default'

package 'curl'
