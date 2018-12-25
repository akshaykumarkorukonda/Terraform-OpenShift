# export TF_VAR_vsphere_user environment variable to your vCenter user
# export TF_VAR_vsphere_password environment variable to your vCenter password
# export TF_VAR_root_password variable to our standard root password from the template
# export TF_VAR_chef_provision='{ user_name = "user", user_key_path = "/path/to/chef/private_key.pem" }'
# To use the Artifactory backend set ARTIFACTORY_PASSWORD and ARTIFACTORY_USERNAME environment variables.

vsphere_server          = "vc01p.utd.com"
vsphere_folder_path     = "OC6"
vsphere_datastore_name  = "PDOT_ISCSI1"
vsphere_datacenter      = "Waltham PDOT"
vsphere_cluster         = "PDOT"
dns_server_list         = ["10.1.113.228", "10.1.113.229"]
dns_suffix_list         = ["utdlab.com", "utd.com"]
domain_name             = "osc.utdlab.com"
time_zone               = "America/New_York"
master_ips = [
    {ipv4_address = "10.1.114.30"}
]
app_ips = [
    {ipv4_address = "10.1.114.32"},
    {ipv4_address = "10.1.114.33"}
]
infra_ips = [
    {ipv4_address = "10.1.114.31"}
]
lb_ips = [
    {ipv4_address = "10.1.114.34"}
]
chef_provision = {
"server_url"             = "https://chef01d.osc.utdlab.com/organizations/utd"
  "environment"          = "test"
  "version"              = "14.4.56"
}
chef_provision_run_list= [
    "role[base]",
    "role[openshift_node]"
]
