# get ip_address 
output "public_ip_address" {
  value = "${ibm_compute_vm_instance.devops_commander_vminstance.ipv4_address}"
}
