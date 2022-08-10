resource "gcore_keypair" "kp" {
  project_id = 1
  sshkey_name = "59508_cloud_paas_ops_gcore_lu_1659953951"
}

resource "gcore_network" "network" {
  name = "prvn"
  mtu = 1450
  type = "vxlan"
  region_id = 1
  project_id = 1
}

resource "gcore_subnet" "subnet" {
  name = "prvns"
  cidr = "192.168.26.0/24"
  network_id = gcore_network.network.id
  dns_nameservers = ["8.8.4.4", "1.1.1.1"]

  gateway_ip = "192.168.26.1"
  region_id = 1
  project_id = 1
}

resource "gcore_instance" "instance" {
  flavor_id = "g1-standard-2-4"
  count   = length(var.domains)
  name = "Dkocheto${count.index}"
  keypair_name = "59508_cloud_paas_ops_gcore_lu_1659953951"

  volume {
    source = "existing-volume"
    volume_id = gcore_volume.first_volume.id
    boot_index = 0
  }

  interface {
    type = "subnet"
    network_id = gcore_network.network.id
    subnet_id = gcore_subnet.subnet.id
  }
}
  resource "local_file" "hosts" {
  count = length(var.domains)
  content = templatefile("inventory.tpl", {
    ipaddr0 = gcore_instance.instance.0.ipv4_address,
    ipaddr1 = gcore_instance.instance.1.ipv4_address
    }
  )
  filename = "hosts"
}
