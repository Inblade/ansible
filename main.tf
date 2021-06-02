resource "google_compute_instance_group" "a13-dk" {
  project = var.project
  name    = "a13-lb"
  zone    = var.zone
  instances = [google_compute_instance.a13-dk-1.self_link,
  google_compute_instance.a13-dk-2.self_link]

  lifecycle {
    create_before_destroy = true
  }

  named_port {
    name = "http"
    port = 8080
  }
}
resource "google_compute_instance" "a13-dk-1" {
  name         = "a13-dk-1" 
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["devops", "dkocheto-at-gmail-com", "web"]

  boot_disk {
    initialize_params {
      image = "debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      
    }
  }
  metadata = {
    ssh-keys = "root:${file("/home/inblade/.ssh/id_rsa.pub")}"
  }
  metadata_startup_script = "sed 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config && mkdir /root/.ssh && echo ${var.my_ssh_dkocheto1} > /root/.ssh/authorized_keys"
}
resource "google_compute_instance" "a13-dk-2" {
  name         = "a13-dk-2" 
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["devops", "dkocheto-at-gmail-com", "web"]

  boot_disk {
    initialize_params {
      image = "debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      
    }
  }
  metadata = {
    ssh-keys = "root:${file("/home/inblade/.ssh/id_rsa.pub")}"
  }
  metadata_startup_script = "sed 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config && mkdir /root/.ssh && echo ${var.my_ssh_dkocheto1} > /root/.ssh/authorized_keys"
}
resource "google_compute_firewall" "firewall" {
  project = var.project
  name    = "dk13-fw"
  network = "default"

  
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]

  target_tags = ["devops", "dkocheto-at-gmail-com", "web"]
  source_tags = ["devops", "dkocheto-at-gmail-com", "web"]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}
