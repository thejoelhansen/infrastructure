variable "env" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "rocky-linux-cloud/rocky-linux-10"
}

variable "zones" {
  description = "Mapping of zone keys to GCP zones"
  type        = map(string)
}

variable "network" {
  type    = string
  default = "default"
}

variable "rhcsa_vpc" {
  description = "The ID of the VPC network to attach VMs to"
  type        = string
}

variable "rhcsa_subnets" {
  description = "Map of subnets IDs keyed by zone"
  type        = map(string)
}
