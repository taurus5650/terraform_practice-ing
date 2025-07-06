provider "google" {
    project = var.project_id
    region = var.region
    zone = var.zone
}

resource "google_compute_network" "vpc_network" {
    name = "docker-vpc"
}

resource "google_compute_firewall" "default" {
    name = "docker-allow"
    network = google_compute_network.vpc_network.name

    dynamic "allow" {
        for_each = var.open_ports
        content {
            protocol = "tcp"
            ports = [allow.value]
        }
    }


    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "docker_vm" {
    name = "docker-vm"
    machine_type = var.machine_type
    zone = var.zone

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
    apt update
    apt install - y docker.io docker - compose git make
    usermod - aG docker ${var.ssh_user}
    cd / home /${var.ssh_user}
    git clone ${var.repo_url} app
    cd app
    make up
    EOT

    tags = ["docker-vm"]

    service_account {
        email = var.service_account_email
        scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }

}
