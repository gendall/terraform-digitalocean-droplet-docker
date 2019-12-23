# DigitalOcean Droplet SSH

A Terraform module that will create a DigitalOcean Droplet with sensible defaults and with the specified SSH key authorized.

## Usage

```hcl
provider "digitalocean" {
  version = "~> 1.6"
}

module "manager_production" {
  source  = "gendall/droplet-ssh/digitalocean"
  name    = "skdadl-graph-manager"
  ssh     = "chatter"
  tags    = ["production"]
}
```
