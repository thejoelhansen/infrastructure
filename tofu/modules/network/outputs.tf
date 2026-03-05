output "rhcsa_vpc" {
  value = google_compute_network.vpc_rhcsa.id
}

output "rhcsa_subnets" {
  value = { for k, s in google_compute_subnetwork.private_subnet : k => s.id }
}
