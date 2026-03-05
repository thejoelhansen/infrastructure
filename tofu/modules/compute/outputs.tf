output "vm_external_ip" {
  value = { 
    for k, v in google_compute_instance.vm_tiny : 
    k => v.network_interface[0].access_config[0].nat_ip 
  }
}

