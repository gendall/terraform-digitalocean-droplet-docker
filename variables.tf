variable "name" {
  type = string
  description = "The name of droplet, to follow the convention {project}-{role}."
}

variable "image" {
  type = string
  default = "debian-9-x64"
  description = "The server image to base this droplet on. Accepts a slug from the DigitalOcean API."
}

variable "size" {
  type = string
  default = "s-1vcpu-1gb"
  description = "The resource sizing of the droplet, specified using the DigitalOcean API slug."
}

variable "region" {
  type = string
  default = "lon1"
  description = "The DigitalOcean datacenter region to locate the droplet in."
}

variable "ssh" {
  type = string
  default = "gendall"
  description = "The name of the SSH key to authorize on the new droplet."
}

variable "tags" {
  type = list
  default = null
  description = "A list of strings to tag the droplet with."
}

variable "number" {
  type = number
  default = 1
  description = "The number of droplets to provide with this configuration."
}
