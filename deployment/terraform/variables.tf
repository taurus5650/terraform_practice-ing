variable "project_id" {}
variable "region" { default = "asia-east1" }
variable "zone" { default = "asia-east1-b" }
variable "machine_type" { default = "e2-micro" }
variable "image" { default = "debian-cloud/debian-11" }
variable "repo_url" {}
variable "service_account_email" {}
variable "open_ports" {
  type = list(string)
  default = ["22", "5002", "5003"]
}
