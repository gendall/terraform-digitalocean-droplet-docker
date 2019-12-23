output "ip" {
  value = digitalocean_droplet.droplet.*.ipv4_address
}

output "ip_private" {
  value = digitalocean_droplet.droplet.*.ipv4_address_private
}
