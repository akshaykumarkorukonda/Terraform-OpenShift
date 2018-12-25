## vSphere Provider
variable vsphere_server                 { default = ""}
variable vsphere_user                   { default = ""}
variable vsphere_password               { default = ""}
variable vsphere_datacenter             { default = ""}
variable vsphere_cluster                { default = ""}
variable vsphere_datastore_name         { default = ""}
variable vsphere_linux_template         { default = "Templates/CentOS75-template"}
variable vsphere_folder_path            { default = ""}

## UTD
variable vsphere_user_utd               { default = ""}
variable vsphere_password_utd           { default = ""}
variable root_password_utd              { default = ""}

## Node
variable env_suffix                      { default = ""}
variable time_zone                       { default = ""}

## Network
#variable vsphere_network_name           { default = ""}
#variable ipv4_gateway                   { default = ""}
#variable ipv4_netmask                   { default = ""}
variable master_ips                      { default = [], type = "list"}
variable app_ips                         { default = [], type = "list"}
variable infra_ips                       { default = [], type = "list"}
variable lb_ips                          { default = [], type = "list"}

variable dns_server_list                 { default = [], type = "list"}
variable dns_suffix_list                 { default = [], type = "list"}
variable domain_name                     { default= ""}

## Chef
variable "root_password"                 { default = ""}
variable "chef_provision" {
  type = "map"

  default = {
    server_url = ""
    environment = ""
    user_name = ""
    user_key_path = ""
    recreate_client = true
    version = ""
    }
}
variable "chef_provision_run_list"      { default = [], type = "list"}