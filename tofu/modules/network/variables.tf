variable "region" {
  description = "Region for the network and subnets"
  type        = string
}

variable "subnets" {
  type = map(object({
    cidr = string
    zone = string
  }))
  default = {
    a = { cidr = "10.0.1.0/24", zone = "us-west1-a" }
    b = { cidr = "10.0.2.0/24", zone = "us-west1-b" }
  }
}
