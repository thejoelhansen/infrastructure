resource "google_compute_instance" "vm_tiny" {
  for_each     = var.zones   # loop over zones
  name         = "rocky-linux-${var.env}-${each.key}"
  machine_type = var.machine_type
  zone         = each.value

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.rhcsa_vpc
    subnetwork = var.rhcsa_subnets[each.key]
    access_config {} # Ephemeral public IP
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = [
    "vm-tiny",
    var.env
  ]
}
