provider "google" {
  credentials = file("key.json")
  project     = "rebrain"
  region      = "us-central1"
}
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "eu-west-1"
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.65.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.33.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}
