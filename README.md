# DigitalOcean Droplet Docker

A Terraform module that will create a DigitalOcean Droplet with Docker installed and the specified SSH key authorized.

## Usage

```hcl
provider "digitalocean" {
  version = "~> 1.6"
}

module "manager_production" {
  source  = "gendall/droplet-docker/digitalocean"
  name    = "skdadl-graph-manager"
  ssh     = "chatter"
  tags    = ["production"]
}
```

## Deployment

This role will be automatically built and deployed to [Terraform Registry](https://registry.terraform.io/modules/gendall) when a [Semver](https://semver.org) tag is pushed to the repo.
