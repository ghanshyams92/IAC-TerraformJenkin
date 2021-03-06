variable "ibmcloud_api_key" {}
variable "iaas_classic_username" {}
variable "iaas_classic_api_key" {}
variable "instance_host" {}

provider "ibm" {
  ibmcloud_api_key   = var.ibmcloud_api_key
  generation         = 1
  region             = "us-south"
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

