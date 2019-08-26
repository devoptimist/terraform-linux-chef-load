# Overview
This module will deploy a chef load instance to a server, and if configured correctly start running a load test
as soon as the service is up.

#### Supported platform families:
 * RHEL
 * DEBIAN
 * SUSE

## Usage

```hcl

module "deploy_chef_load" {
  source               = "devoptimist/chef-load/linux"
  version              = "0.0.1"
  ips                  = ["172.16.0.23"]
  instance_count       = 1
  ssh_user_name        = "ec2-user"
  ssh_user_private_key = "~/.ssh/id_rsa"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|ips|A list of ip addresses where we will install hab and run chef-load|list|[]|no|
|instance_count|The number of instances being created|number|0|no|
|ssh_user_name|The ssh user name used to access the ip addresses provided|string||yes|
|ssh_user_pass|The ssh user password used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)|string|""|no|
|ssh_user_private_key|The ssh user key used to access the ip addresses (either ssh_user_pass or ssh_user_private_key needs to be set)|string|""|no|
|hab_sup_peers|A list of peers for the supervisor to connect to|list|[]|no|
|channel|The habitat builder channel to pull the chef-load package from|string|"stable"|no|
|service_group|The service group name to use for this service|string|"default"|no|
|services|A map of other habitat services to load along side this one|map|{}|no|
|log_file|The path to the log file fpr chef load to use|string|"/tmp/chef-load.log"|no|
|num_nodes|The number of chef client nodes to simulate|number|30|no|
|num_actions|During the same interval of time, it is also possible to load a number of Chef actions|number|30|no|
|interval|chef-load will evenly distribute the number of nodes across the desired interval (minutes)|number|30|no|
|node_name_prefix|The prefix to give each node|string|"chef-load"|no|
|chef_environment|The environment to use for each node|string|"_default"|no|
|ohai_json_file|The path to the file to use for ohai data. The devoptimist/chef-load hab package comes with preloaded ohia json data. (found in /hab/svc/chef-load/static/|string|"/hab/svc/chef-load/static/sample-data/example-ohai.json"|no|
|chef_server_host|The hostname of ip address of the chef-server to test|string||yes|
|chef_server_org|The organization to use on the chef server|string||yes|
|chef_server_client_name|The name of an admin user in the org that was specified|string||yes|
|chef_server_client_key_path|The path to write the client key out to on the chef-load server|string|/tmp/client.pem|no|
|chef_server_client_key|The content of the clients private key|string||yes|
