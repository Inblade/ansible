variable "do_token" {
  type        = string
  description = "digitalocean_token"
}
variable "my_ssh_devops" {
  type        = string
  description = "#my_ssh_key"
}
/*variable "my_ssh_privetops" {
  type        = string
  description = "#my_ssh_privetops"
}*/
variable "rebrain" {
  type        = string
  description = "rebrain_ssh_key"
}
variable "ssh_fingerprint" {
  type        = string
  description = "fingerprint"
}
/*variable "conumb" {
  type        = list(any)
  default     = ["1"]
  description = "var array"
}
variable "devs" {
  type    = list(string)
  default = ["ansible-Dkocheto"]
}*/
