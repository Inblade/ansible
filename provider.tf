provider "digitalocean" { token = var.do_token }
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "eu-central-1"
}
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.28.0"
    }
  }
}
