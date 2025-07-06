provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "docker-vpc"
}

resource "google_compute_firewall" "docker_firewall" {
  name    = "docker-allow"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = var.open_ports
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "docker_vm" {
  name         = "docker-vm"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io docker-compose git make
    usermod -aG docker debian
    cd /home/debian
    git clone ${var.repo_url} app
    cd app
    make up
  EOT

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
