variable "do_token" {
  type        = string
  description = "digitalocean_token"
}
variable "my_ssh_dkochetov1" {
  type        = string
  description = "my_ssh_key"
}
variable "rebrain" {
  type        = string
  description = "rebrain_ssh_key"
}
variable "ssh_fingerprint" {
  type        = string
  description = "fingerprint"
}
variable "aws_access_key" {
  type        = string
  description = "aws_access_key"
}
variable "aws_secret_key" {
  type        = string
  description = "aws_secret_key"
}

#variable "zone_id" {
#type=string
#}

variable "domains" {
  type = list(any)
}

variable "connection" {
  default = {
    user        = "root"
    type        = "ssh"
    private_key = "/home/inblade/.ssh/id_rsa"
  }
}
