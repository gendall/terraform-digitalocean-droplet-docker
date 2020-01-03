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
    ignore_changes = [tags]
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "until [ -f /var/lib/cloud/instance/boot-finished ]; do sleep 1; done",
      "apt-get update > /dev/null",
      "apt-get install -yq apt-transport-https ca-certificates curl gnupg2 software-properties-common python3-pip > /dev/null",
      "curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -",
      "add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable\"",
      "sudo apt-get update > /dev/null",
      "apt-get install -yq docker-ce=5:18.09.0~3-0~debian-stretch docker-ce-cli=5:18.09.0~3-0~debian-stretch containerd.io > /dev/null",
      "pip3 install jsondiff docker > /dev/null"
    ]
    connection {
      host = self.ipv4_address
      private_key = file("~/.ssh/id_rsa")
    }
  }
}
