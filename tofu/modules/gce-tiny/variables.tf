variable "env" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "zone" {
  type = string
}

variable "image" {
  type    = string
  default = "rocky-linux-cloud/rocky-linux-10"
}

variable "network" {
  type    = string
  default = "default"
}
