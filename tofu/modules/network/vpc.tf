resource "google_compute_network" "vpc_rhcsa" {
    name = "vpc-rhcsa"
    auto_create_subnetworks = false
    routing_mode = "REGIONAL"
}
