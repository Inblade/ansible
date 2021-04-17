variable "do_token" {
  type        = string
  description = "digitalocean_token"
}
variable "my_ssh_dkocheto" {
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
variable "my_ssh_dkocheto1" {
  type = string
}
variable "aws_access_key" {
  type        = string
  description = "aws_access_key"
}
variable "aws_secret_key" {
  type        = string
  description = "aws_secret_key"
}
variable "connection" {
  default = {
    user        = "root"
    type        = "ssh"
    private_key = "/home/inblade/.ssh/id_rsa"
  }
}
variable "domains" {
  type = list(any)
}
