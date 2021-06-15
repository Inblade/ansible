resource "google_compute_network" "ans13-vm-network" {
  name = "ans-vm-network"
}

resource "google_compute_address" "ans13-vm" {
  count = length(var.devs)
  name  = var.devs[count.index]
}

resource "google_compute_global_address" "ans13-lb-address" {
  name = "ans-lb-address"
}

# VPSs

resource "google_compute_instance" "ans13-vm" {
  count        = length(var.devs)
  name         = var.devs[count.index]
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["devops", "dkocheto-at-gmail-com"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.ans13-vm[count.index].address
    }
  }

  metadata = {
    ssh-keys = "root:${file("/home/inblade/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = "sed 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config && mkdir /root/.ssh && echo ${var.my_ssh_dkocheto1} > /root/.ssh/authorized_keys"
}

resource "local_file" "ansible_inventory" {
  count = length(var.devs)
  content = templatefile("inventory.tpl", {
    name0   = "google_compute_instance.ans13-vm.0.name",
    ipaddr0 = "google_compute_address.ans13-vm.0.address",
    name1   = "google_compute_instance.ans13-vm.1.name",
    ipaddr1 = "google_compute_address.ans13-vm.1.address"
    }
  )
  filename = "hosts"
}

#Balancing GCP

# Создаем группу для наших VPS
resource "google_compute_instance_group" "ans13-group" {
  name        = "ans13-group"
  description = "Instance Group for LB GCP"

  instances = [
    google_compute_instance.ans13-vm[0].id,
    google_compute_instance.ans13-vm[1].id
  ]

  named_port {
    name = "http"
    port = "80"
  }

  zone = var.zone
}

# Создаем разрешающее правило файрвола для Google Cloud health checking systems
resource "google_compute_firewall" "ans13-firewall" {
  name    = "ans13-firewall"
  network = google_compute_network.ans13-vm-network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# Создаем health check
resource "google_compute_health_check" "ans13-health-check" {
  name               = "ans13-health-check"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port = 80
  }
}

# Создаем backend service
resource "google_compute_backend_service" "ans13-backend-service" {
  name                  = "ans13-backend-service"
  health_checks         = [google_compute_health_check.ans13-health-check.id]
  load_balancing_scheme = "EXTERNAL"
  protocol              = "HTTP"
  backend {
    group = google_compute_instance_group.ans13-group.id
  }
}

# Создаем URL map для входящих запросов для дефолтного backend service
resource "google_compute_url_map" "ans13-url-map" {
  name            = "ans13-url-map"
  description     = "url map for service"
  default_service = google_compute_backend_service.ans13-backend-service.id
}

# Создаем HTTP proxy для маршрутизации запросов для нашего URL map
resource "google_compute_target_http_proxy" "ans13-http-proxy" {
  name    = "ans13-http-proxy"
  url_map = google_compute_url_map.ans13-url-map.id
}

# Создаем глобальное правило форвардинга для входящих запросов к нашему proxy
resource "google_compute_global_forwarding_rule" "ans13-forwarding-rule" {
  name       = "ans13-forwarding-rule"
  ip_address = google_compute_global_address.ans13-lb-address.address
  target     = google_compute_target_http_proxy.ans13-http-proxy.id
  port_range = "80"
}
