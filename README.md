# terrafom-okd-cluster-oc6
This is a set of Terraform manifests that are used to deploy a multi-node Openshift cluster (OC8).

## Platforms

* VMware vSphere 6.x
* CentOS 7.5

## Prerequisites
- vSphere credentials
- Set all required environment variables as specified in the top section of `terraform.tfvars`
  - `TF_VAR_vsphere_user`
  - `TF_VAR_vsphere_password`
  - `TF_VAR_root_password`
  - `TF_VAR_chef_provision`
- Terraform v0.11.6+
  - provider.vsphere v1.6.0+ (downloaded during `terraform init`)

**Note** - Do **_NOT_** run Terraform on the included manifests without understanding exactly how Terraform works. It will **_DESTROY_** existing servers if it detects any configuration changes or drift.

## Usage
For additional details related to the underlying module, visit https://bitbucket.uptodate.com/projects/TFORM/repos/terraform-module-okd-cluster/browse

## TODO
- Refactor the "LB" node used for HA Proxy. It doesn't need a secondary drive.
- Add a remote backend once we have the required infrastructure

## Change log

### 0.2.5
- Moved VMs to OC8 folder inside AMT folder in vSphere
- Added latest state file

### 0.2.4
- Added `terraform.tfstate` file so that other workstations have a valid/current state file to work from. 

### 0.2.3
- Add additional app node
- Increase resources across multiple nodes

### 0.2.2
- Moving to AMT VMware cluster *CDR-233*
  - Increase app nodes from 3 -> 5
  - Increase VM resources on apps nodes
- Remove unique values in `terraform.tfvars`
- Renamed `node_ips` var to `app_ips` to remove confusion

### 0.2.1
- Modified `nm_domains.sh` to fix *CDR-179*

### 0.2.0
- Added Chef Role `role[openshift_node]`
- Added variable size of secondary disk
- Added variable `domain_name` suffix for host FQDN.
- Added variable `dns_suffix_list` for multiple search domains.
- Added script `nm_domains.sh` to fix NM `/etc/resolv.conf`

### 0.1.0
Initial release
