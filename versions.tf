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
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.26.0"
    }
  }
}
