variable "my_ssh_dkocheto1" {
  type        = string
  description = "my_ssh_key"
}
variable "zone" {
  type        = string
  description = "dns route53"
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
variable "domains" {
  type = list(any)
}
variable "devs" {
  type = list(any)
}
