resource "google_compute_subnetwork" "private_subnet" {
  for_each = var.subnets

  name   = "private-rhcsa-${each.key}"
  ip_cidr_range = each.value.cidr
  region = var.region
  network = google_compute_network.vpc_rhcsa.id
}
