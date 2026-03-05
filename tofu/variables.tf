variable "project_id" {
  description = "GCP project"
  type        = string
}

variable "region" {
  description = "Default region" 
  type        = string
  default     = "us-west1"
}

variable "zone" {
  description = "Default zone"
  type        = string
  default     = "us-west1-a"
}

variable "zones" {
  description = "Mapping of zone keys to GCP zones"
  type        = map(string)
  default     = {
    a = "us-west1-a"
    b = "us-west1-b"
  }
}

variable "env" {
  description = "Environment variable pulled from dev.tfvars or prod.tfvars"
  type        = string
}

