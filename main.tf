terraform {
  required_providers {
    ibm = {
      source  = "localdomain/provider/ibm"
      version = "1.10.0"
    }
  }
 }
# Create an IBM Cloud infrastructure SSH key. You can find the SSH key surfaces in the infrastructure console under Devices > Manage > SSH Keys
resource "ibm_compute_ssh_key" "provision_key_dc" {
  label      = "test_key_dc"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "ibm_compute_vm_instance" "devops_commander_vminstance" {
  hostname                   = "newhost"
  domain                     = "IBM.cloud"
  ssh_key_ids       	     = [ibm_compute_ssh_key.provision_key_dc.id]
  os_reference_code          = "UBUNTU_LATEST_64"
  datacenter                 = "dal12"
  hourly_billing             = true
  private_network_only       = false
  network_speed     	     = 10
  cores                      = 1
  memory                     = 1024
  disks                      = [25, 20]
  user_metadata              = "{\"Triggered by IBM DevOpsCommander\":\"This is a test instance provisioned by IBM DevOps Commander\"}"
  dedicated_acct_host_only   = true
  local_disk                 = false
##  public_vlan_id             = 2218979
##  private_vlan_id            = 2218977
##  public_security_group_ids  = 302729

##  provisioner "local-exec" {
##    command = "sleep 80"
### }
##  provisioner "local-exec" {
##     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${ibm_compute_vm_instance.devops_commander_vminstance.ipv4_address},' master.yml"
#    }
}

