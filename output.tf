# get ip_address 
output "public_ip_address" {
  value = "${ibm_compute_vm_instance.devops_commander_vminstance.ipv4_address}"
}

# get ip_address 
output "private_ip_address" {
  value = "${ibm_compute_vm_instance.devops_commander_vminstance.ipv4_address_private}"
}
output "instance_id" {
  description = "ID of the vm instance"
  value       = "${ibm_compute_vm_instance.devops_commander_vminstance.id}"
}

# get Public subnet 
output "public_subnetid" {
  value = "${ibm_compute_vm_instance.devops_commander_vminstance.public_subnet_id}"
}

# get private subnet 
output "private_subnetid" {
  value = "${ibm_compute_vm_instance.devops_commander_vminstance.private_subnet_id}"
}


  
