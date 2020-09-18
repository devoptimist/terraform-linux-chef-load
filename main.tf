locals {
  instance_count = var.instance_count # length(ips) when terraform allows 
  service        = {
    "devoptimist/chef-load" = {
      "channel" = var.channel,
      "group"   = var.service_group,
      "user_toml_config"  = {
        "log_file"         = var.log_file,
        "num_nodes"        = var.num_nodes,
        "interval"         = var.interval,
        "num_actions"      = var.num_actions,
        "node_name_prefix" = var.node_name_prefix,
        "chef_environment" = var.chef_environment,
        "ohai_json_file"   = var.ohai_json_file,
        "chef_server" = {
          "host"              = var.chef_server_host,
          "organization"      = var.chef_server_org,
          "client_name"       = var.chef_server_client_name,
          "client_key_path"   = var.chef_server_client_key_path,
          "client_key"        = var.chef_server_client_key
        }
      }
    }
  }
  services = length(keys(var.services)) > 1 ? merge(local.service, var.services) : local.service
}

module "load-chef-load" {
  source            = "srb3/habitat/chef"
  version           = "0.13.0"
  ips               = var.ips
  instance_count    = local.instance_count
  user_name         = var.ssh_user_name
  user_pass         = var.ssh_user_pass
  user_private_key  = var.ssh_user_private_key
  user_names        = var.ssh_user_names
  user_passes       = var.ssh_user_passes
  user_private_keys = var.ssh_user_private_keys
  hab_services      = local.services
  hab_sup_peers     = var.hab_sup_peers
}
