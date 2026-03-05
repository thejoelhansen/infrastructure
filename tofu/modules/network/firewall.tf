resource "google_compute_firewall" "outbound_web" {
  name        = "outbound-web"
  description = "Allow browsing of public internet"
 
  network = google_compute_network.vpc_rhcsa.id 
  direction = "EGRESS"
  
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  destination_ranges = ["0.0.0.0/0"]
}
