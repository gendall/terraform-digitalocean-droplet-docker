data "digitalocean_ssh_key" "key" {
  name   = var.ssh
}

resource "digitalocean_droplet" "droplet" {
  image  = var.image
  name   = var.name
  size   = var.size
  region = var.region
  tags   = var.tags
  count  = var.number
  ssh_keys = [data.digitalocean_ssh_key.key.id]
  private_networking = true
  monitoring = true
  
  lifecycle {
    ignore_changes = ["tags"]
  }
}
