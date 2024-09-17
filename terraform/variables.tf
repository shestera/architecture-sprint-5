variable "folder_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_key" {
  type      = string
  sensitive = true
}
