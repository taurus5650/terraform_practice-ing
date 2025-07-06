variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  default = "asia-east1"
}

variable "zone" {
  default = "asia-east1-b"
}

variable "open_ports" {
  description = "List of ports to open on the firewall"
  type        = list(string)
  default     = ["22", "5002", "5003"]
}

variable "machine_type" {
  default = "e2-micro"
}

variable "image" {
  default = "debian-cloud/debian-11"
}

variable "repo_url" {
  description = "Git repo URL to clone"
}

variable "ssh_user" {
  default = "debian"
}

variable "service_account_email" {
  description = "Service account email for VM"
}
