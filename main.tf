data "digitalocean_ssh_key" "rebrain" {
  name = "REBRAIN.SSH.PUB.KEY"
}

#create resource my_ssh_key
resource "digitalocean_ssh_key" "my_ssh_dkochetov1" {
  name       = "my_ssh_dkochetov"
  public_key = file("/home/inblade/.ssh/id_rsa.pub")
}
resource "digitalocean_tag" "devops" {
  name = "devops"
}
resource "digitalocean_tag" "mail" {
  name = "dkocheto_at_gmail_com"
}
data "aws_route53_zone" "dns" {
  name         = "devops.rebrain.srwx.net."
  private_zone = false
}

resource "aws_route53_record" "dns_rebrain" {
  count   = length(var.domains)
  zone_id = data.aws_route53_zone.dns.zone_id
  name    = "Dkocheto-${element(var.domains, count.index)}.${data.aws_route53_zone.dns.name}"
  type    = "A"
  ttl     = "30"
  records = [element(digitalocean_droplet.Dkocheto[*].ipv4_address, count.index)]

}

resource "digitalocean_droplet" "Dkocheto" {
  count    = length(var.domains)
  image    = "ubuntu-16-04-x64"
  name     = "Dkocheto${count.index}"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  tags     = [digitalocean_tag.devops.id, digitalocean_tag.mail.id]
  ssh_keys = [digitalocean_ssh_key.my_ssh_dkochetov1.id, data.digitalocean_ssh_key.rebrain.id]
  connection {
    type        = "ssh"
    host        = self.ipv4_address
    user        = "root"
    private_key = file(var.connection.private_key)

  }

  provisioner "remote-exec" {
    inline = ["touch /root/123"]
  }

  provisioner "local-exec" {
    command = <<EOF
echo --- > host.yml
echo "all:" >> host.yml
echo " children:" >> host.yml
echo "  rebrain:" >> host.yml
echo "   vars:" >> host.yml
echo "    ansible_user: root" >> host.yml
echo "    ansible_ssh_private_key_file: /root/.ssh/id_rsa" >> host.yml

echo --- > playbook1.yml
echo "- name: Install NGINX" >> playbook1.yml
echo "  hosts: all" >> playbook1.yml
echo "  become: yes" >> playbook1.yml
echo "  tasks:" >> playbook1.yml
echo "  - name: Install Nginx" >> playbook1.yml
echo "    apt: name=nginx" >> playbook1.yml
echo "  - name: Autostart webserver" >> playbook1.yml
echo "    service: name=nginx state=started enabled=yes" >> playbook1.yml
echo "- name: Configuring Nginx dkochetov-1" >> playbook1.yml
echo "  hosts: dkochetov-1.devops.rebrain.srwx.net" >> playbook1.yml
echo "  become: yes" >> playbook1.yml
echo "  tasks:" >> playbook1.yml
echo "  - name: Generate nginx.conf" >> playbook1.yml
echo "    template: src=nginx/nginx1.j2 dest=/etc/nginx/nginx.conf mode=0644" >> playbook1.yml
echo "    notify: Reload nginx" >> playbook1.yml
echo "  - name: Copy hostname1" >> playbook1.yml
echo "    template: src=hostname/hostname1 dest=/etc/hostname mode=0644" >> playbook1.yml
echo "  handlers:" >> playbook1.yml
echo "  - name: Reload nginx" >> playbook1.yml
echo "    service: name=nginx state=reloaded" >> playbook1.yml

echo --- > playbook2.yml
echo "- name: Install NGINX" >> playbook2.yml
echo "  hosts: all" >> playbook2.yml
echo "  become: yes" >> playbook2.yml
echo "  tasks:" >> playbook2.yml
echo "  - name: Install epel-release" >> playbook2.yml
echo "    yum: name=epel-release state=latest" >> playbook2.yml
echo "  - name: Install Nginx" >> playbook2.yml
echo "    yum: name=nginx" >> playbook2.yml
echo "  - name: Autostart webserver" >> playbook2.yml
echo "    service: name=nginx state=started enabled=yes" >> playbook2.yml
echo "- name: Configuring Nginx 23uk-2" >> playbook2.yml
echo "  hosts: 23uk-2.devops.rebrain.srwx.net" >> playbook2.yml
echo "  become: yes" >> playbook2.yml
echo "  tasks:" >> playbook2.yml
echo "  - name: Generate nginx.conf" >> playbook2.yml
echo "    template: src=nginx/nginx2.j2 dest=/etc/nginx/nginx.conf mode=0644" >> playbook2.yml
echo "    notify: Reload nginx" >> playbook2.yml
echo "  - name: Create directory" >> playbook2.yml
echo "    file: path=/home/23uk-2.devops.rebrain.srwx.net state=directory" >> playbook2.yml
echo "  - name: Copy index.html" >> playbook2.yml
echo "    template: src=html/index.html dest=/home/23uk-2.devops.rebrain.srwx.net/index.html mode=0644" >> playbook2.yml
echo "    notify: Reload nginx" >> playbook2.yml
echo "  - name: Copy hostname2" >> playbook2.yml
echo "    template: src=hostname/hostname2 dest=/etc/hostname mode=0644" >> playbook2.yml
echo "  handlers:" >> playbook2.yml
echo "  - name: Reload nginx" >> playbook2.yml
echo "    service: name=nginx state=reloaded" >> playbook2.yml

EOF
  }

}

resource "null_resource" "playbook1" {
  provisioner "local-exec" {
    command = "ansible-playbook playbook1.yml -i 'dkochetov-1.devops.rebrain.srwx.net,'"
  }
  depends_on = [digitalocean_droplet.Dkocheto]
}

resource "null_resource" "playbook2" {
  provisioner "local-exec" {
    command = "ansible-playbook playbook2.yml -i 'dkochetov-2.devops.rebrain.srwx.net,'"
  }
  depends_on = [null_resource.playbook1]
}






#output "aws_route53_zone" {
#  value = data.aws_route53_zone.dns.zone_id
#}
