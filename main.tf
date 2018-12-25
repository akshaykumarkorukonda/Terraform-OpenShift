#terraform {
#  backend "artifactory" {
#    url                 = "https://artifacts.emmisolutions.com/"
#    repo                = "terraform"
#    subpath             = "test-openshift"
#  }
#}

module "master" {
  source                = "git::ssh://git@bitbucket.uptodate.com:7999/tform/terraform-module-okd-cluster.git//node?ref=v0.2.0"
  #source                = "../terraform-module-okd-cluster/node"

  ## provider
  vsphere_server        = "${var.vsphere_server}"
  vsphere_user          = "${var.vsphere_user_utd}"
  vsphere_password      = "${var.vsphere_password_utd}"
  vsphere_datacenter    = "${var.vsphere_datacenter}"
  vsphere_datastore_name= "${var.vsphere_datastore_name}"
  vsphere_linux_template= "${var.vsphere_linux_template}"

  ## node
  node_count            = 1
  node_name             = "oc6m"
  env_suffix            = "d"
  node_num_cpus         = 2
  node_memory           = 12288
  node_disk_size        = 30
  node_disk2_size       = 100
  vsphere_folder_path   = "${var.vsphere_folder_path}"
  vsphere_network_name  = "114 VM Network"
  node_ips              = "${var.master_ips}"
  ipv4_netmask          = 24
  ipv4_gateway          = "10.1.114.1"
  dns_server_list       = "${var.dns_server_list}"
  dns_suffix_list       = "${var.dns_suffix_list}"
  domain_name           = "${var.domain_name}"
  time_zone             = "${var.time_zone}"

  ## chef
  chef_provision        = "${var.chef_provision}"
  chef_provision_run_list= "${var.chef_provision_run_list}"
  root_password         = "${var.root_password_utd}"
}

module "app_node" {
  source                = "git::ssh://git@bitbucket.uptodate.com:7999/tform/terraform-module-okd-cluster.git//node?ref=v0.2.0"
  #source                = "../terraform-module-okd-cluster/node"

  ## provider
  vsphere_server        = "${var.vsphere_server}"
  vsphere_user          = "${var.vsphere_user_utd}"
  vsphere_password      = "${var.vsphere_password_utd}"
  vsphere_datacenter    = "${var.vsphere_datacenter}"
  vsphere_cluster       = "${var.vsphere_cluster}"
  vsphere_datastore_name= "${var.vsphere_datastore_name}"
  vsphere_linux_template= "${var.vsphere_linux_template}"

  ## node
  node_count            = 2
  node_name             = "oc6a"
  env_suffix            = "d"
  node_num_cpus         = 6
  node_memory           = 32768
  node_disk_size        = 50
  node_disk2_size       = 100
  vsphere_folder_path   = "${var.vsphere_folder_path}"
  vsphere_network_name  = "114 VM Network"
  node_ips              = "${var.app_ips}"
  ipv4_netmask          = 24
  ipv4_gateway          = "10.1.114.1"
  dns_server_list       = "${var.dns_server_list}"
  dns_suffix_list       = "${var.dns_suffix_list}"
  domain_name           = "${var.domain_name}"
  time_zone             = "${var.time_zone}"

  ## chef
  chef_provision        = "${var.chef_provision}"
  chef_provision_run_list= "${var.chef_provision_run_list}"
  root_password         = "${var.root_password_utd}"
}

module "infra_node" {
  source                = "git::ssh://git@bitbucket.uptodate.com:7999/tform/terraform-module-okd-cluster.git//node?ref=v0.2.0"
  #source                = "../terraform-module-okd-cluster/node"

  ## provider
  vsphere_server        = "${var.vsphere_server}"
  vsphere_user          = "${var.vsphere_user_utd}"
  vsphere_password      = "${var.vsphere_password_utd}"
  vsphere_datacenter    = "${var.vsphere_datacenter}"
  vsphere_cluster       = "${var.vsphere_cluster}"
  vsphere_datastore_name= "${var.vsphere_datastore_name}"
  vsphere_linux_template= "${var.vsphere_linux_template}"

  ## node
  node_count            = 1
  node_name             = "oc6i"
  env_suffix            = "d"
  node_num_cpus         = 4
  node_memory           = 24576
  node_disk_size        = 50
  node_disk2_size       = 100
  vsphere_folder_path   = "${var.vsphere_folder_path}"
  vsphere_network_name  = "114 VM Network"
  node_ips              = "${var.infra_ips}"
  ipv4_netmask          = 24
  ipv4_gateway          = "10.1.114.1"
  dns_server_list       = "${var.dns_server_list}"
  dns_suffix_list       = "${var.dns_suffix_list}"
  domain_name           = "${var.domain_name}"
  time_zone             = "${var.time_zone}"

  ## chef
  chef_provision        = "${var.chef_provision}"
  chef_provision_run_list= "${var.chef_provision_run_list}"
  root_password         = "${var.root_password_utd}"
}

module "lb_node" {
  source                = "git::ssh://git@bitbucket.uptodate.com:7999/tform/terraform-module-okd-cluster.git//node?ref=v0.2.0"
  #source                = "../terraform-module-okd-cluster/node"

  ## provider
  vsphere_server        = "${var.vsphere_server}"
  vsphere_user          = "${var.vsphere_user_utd}"
  vsphere_password      = "${var.vsphere_password_utd}"
  vsphere_datacenter    = "${var.vsphere_datacenter}"
  vsphere_cluster       = "${var.vsphere_cluster}"
  vsphere_datastore_name= "${var.vsphere_datastore_name}"
  vsphere_linux_template= "${var.vsphere_linux_template}"

  ## node
  node_count            = 1
  node_name             = "oc6lb"
  env_suffix            = "d"
  node_num_cpus         = 2
  node_memory           = 2048
  node_disk_size        = 20
  node_disk2_size       = 1
  vsphere_folder_path   = "${var.vsphere_folder_path}"
  vsphere_network_name  = "114 VM Network"
  node_ips              = "${var.lb_ips}"
  ipv4_netmask          = 24
  ipv4_gateway          = "10.1.114.1"
  dns_server_list       = "${var.dns_server_list}"
  dns_suffix_list       = "${var.dns_suffix_list}"
  domain_name           = "${var.domain_name}"
  time_zone             = "${var.time_zone}"

  ## chef
  chef_provision        = "${var.chef_provision}"
  chef_provision_run_list= "${var.chef_provision_run_list}"
  root_password         = "${var.root_password_utd}"
}
