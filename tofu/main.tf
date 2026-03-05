# Compute

module "vm_tiny" {
  source = "./modules/compute"

  env          = var.env
  machine_type = "e2-micro"
  zones        = var.zones
  rhcsa_vpc     = module.network.rhcsa_vpc
  rhcsa_subnets = module.network.rhcsa_subnets
}

# Network

module "network" {
  source = "./modules/network"
  region = var.region
}
