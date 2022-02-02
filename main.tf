#Data block
data "aws_route53_zone" "dns" {
  name         = "devops.sample.srwx.net"
  private_zone = false
}
data "digitalocean_ssh_key" "another" {
  name = "another.SSH.PUB.KEY"
}
#create resource my_ssh_key
resource "digitalocean_ssh_key" "my_ssh_dkocheto" {
  name       = "my_ssh_dkocheto"
  public_key = file("/home/inblade/.ssh/id_rsa.pub")
}
#create tags for DO droplet
resource "digitalocean_tag" "devops" {
  name = "devops"
}
resource "digitalocean_tag" "mail" {
  name = "dkocheto_at_gmail_com"
}
resource "aws_route53_record" "dns_rebrain" {
  zone_id = data.aws_route53_zone.dns.zone_id
  count   = length(var.domains)
  name    = "dkocheto-${element(var.domains, count.index)}.${data.aws_route53_zone.dns.name}"
  type    = "A"
  ttl     = "30"
  records = [element(digitalocean_droplet.Dkocheto.*.ipv4_address, count.index)]
}
#create DO droplet
resource "digitalocean_droplet" "Dkocheto" {
  count    = length(var.domains)
  image    = "ubuntu-20-04-x64"
  name     = "Dkocheto${count.index}"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  tags     = [digitalocean_tag.devops.id, digitalocean_tag.mail.id]
  ssh_keys = [digitalocean_ssh_key.my_ssh_dkocheto.id, data.digitalocean_ssh_key.another.id]

}

resource "null_resource" "playbook" {
  provisioner "local-exec" {
    command = "sleep 15 && ansible-playbook playbook.yml -i hosts"
  }
  depends_on = [aws_route53_record.dns_rebrain]
}

/*resource "local_file" "hosts" {
  count    = length(var.devs)
  filename = "hosts"
  content = templatefile("${path.module}/inventory.tpl", {
    ip1 = digitalocean_droplet.Dkocheto.*.ipv4_address
  })
}
*/
resource "local_file" "hosts" {
  count = length(var.domains)
  content = templatefile("inventory.tpl", {
    ipaddr0 = digitalocean_droplet.Dkocheto.0.ipv4_address,
    ipaddr1 = digitalocean_droplet.Dkocheto.1.ipv4_address
    }
  )
  filename = "hosts"
}
