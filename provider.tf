# needed for terraform >= 0.13
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.25.2"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}
