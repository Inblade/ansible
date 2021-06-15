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

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "region" {
  description = "The region to create the resources in."
  type        = string
}
variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
  default     = "http-multi-backend"
}
