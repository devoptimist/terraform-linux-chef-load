variable "ips" {
  description = "A list of ip addresses where we will install hab and run services"
  type        = list
}

variable "instance_count" {
  description = "The number of instances that will have chef-solo run on them"
  type        = number
}

variable "ssh_user_name" {
  description = "The ssh user name used to access the ip addresses provided"
  type        = string
  default     = ""
}

variable "ssh_user_names" {
  description = "A list of ssh user names used to access the ip addresses provided"
  type        = list(string)
  default     = []
}

variable "ssh_user_pass" {
  description = "The ssh password used to access the ip addresses (either user_pass or user_private_key needs to be set)"
  type        = string
  default     = ""
}

variable "ssh_user_passes" {
  description = "A list of ssh passwords used to access the ip addresses (either user_pass or user_private_key needs to be set)"
  type        = list(string)
  default     = []
}

variable "ssh_user_private_key" {
  description = "The user key used to access the ip addresses (either user_pass or user_private_key needs to be set)"
  type        = string
  default     = ""
}

variable "ssh_user_private_keys" {
  description = "A list of user keys used to access the ip addresses (either user_pass/s or user_private_key/s needs to be set)"
  type        = list(string)
  default     = []
}

########### supervisor details #####################

variable "hab_sup_peers" {
  description = "A list of peers for the supervisor to connect to"
  type        = list
  default     = []
}

variable "channel" {
  description = "The habitat builder channel to pull from"
  type        = string
  default     = "stable"
}

variable "service_group" {
  description = "The service group name to use for this service"
  type        = string
  default     = "default"
}

variable "services" {
  description = "A map of other habitat services to load along side this one"
  type        = map
  default     = {}
}

########### service user toml ###################

variable "log_file" {
  description = "The path to the log file"
  type        = string
  default     = "/tmp/chef-load.log"
}

variable "num_nodes" {
  description = "The number of chef client nodes to simulate"
  type        = number
  default     = 30
}

variable "num_actions" {
  description = "During the same interval of time, it is also possible to load a number of Chef actions"
  type        = number
  default     = 30
}

variable "interval" {
  description = <<EOF
chef-load will evenly distribute the number of nodes across the desired interval (minutes)
Examples:
  30 nodes / 30 minute interval =  1 chef-client run per minute
  1800 nodes / 30 minute interval = 60 chef-client runs per minute
EOF
  type        = number
  default     = 30
}

variable "node_name_prefix" {
  description = "The prefix to give each node"
  type        = string
  default     = "chef-load"
}

variable "chef_environment" {
  description = "The environment to use for each node"
  type        = string
  default     = "_default"
}

variable "ohai_json_file" {
  description = <<EOF
The path to the file to use for ohai data. The devoptimist/chef-load
hab package comes with the following preloaded ohai data files
/hab/svc/chef-load/static/sample-data/example-ohai.json
/hab/svc/chef-load/static/sample-data/1mb_ohai.json
/hab/svc/chef-load/static/sample-data/2mb_ohai.json
/hab/svc/chef-load/static/sample-data/3mb_ohai.json
/hab/svc/chef-load/static/sample-data/4mb_ohai.json
/hab/svc/chef-load/static/sample-data/5mb_ohai.json
EOF
  type       = string
  default    = "/hab/svc/chef-load/static/sample-data/example-ohai.json"
}


########### chef server specific variables ######

variable "chef_server_host" {
  description = "The hostname of ip address of the chef-server to test"
  type        = string
}

variable "chef_server_org" {
  description = "The organization to use on the chef server"
  type        = string
}

variable "chef_server_client_name" {
  description = "The name of an admin user in the org that was specified"
  type        = string
}

variable "chef_server_client_key_path" {
  description = "The path to write the client key out to on the chef-load server"
  type        = string
  default     = "/tmp/client.pem"
}

variable "chef_server_client_key" {
  description = "The content of the clients private key"
  type        = string
}
