variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-east1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "asia-east1-b"
}

variable "vm_name" {
  description = "VM name"
  type        = string
  default     = "docker-vm"
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "OS image"
  type        = string
  default     = "debian-cloud/debian-11"
}
