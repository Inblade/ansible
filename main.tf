resource "google_compute_instance" "a13-dk-1" {
  count        = length(var.domains)
  name         = var.devs[count.index]
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
      nat_ip = google_compute_address.a13-ip.address
    }
  }
  metadata = {
    ssh-keys = "root:${file("/home/inblade/.ssh/id_rsa.pub")}"
  }
  metadata_startup_script = "sed 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config && mkdir /root/.ssh && echo ${var.my_ssh_dkocheto1} > /root/.ssh/authorized_keys"
}
resource "google_compute_address" "a13-ip" {
  name = "a13-ip"
}
resource "local_file" "hosts" {
  count = length(var.domains)
  content = templatefile("inventory.tpl", {
    ippadr1 = google_compute_instance.a13-dk-1[count.index].network_interface.0.access_config.0.nat_ip
    }
  )
  filename = "hosts"
}
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}
