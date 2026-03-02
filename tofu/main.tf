module "tiny_vm" {
  source = "./modules/gce-tiny"

  env          = var.env
  machine_type = "e2-micro"
  zone         = var.zone
}
