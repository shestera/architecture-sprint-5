terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.129.0"
    }
  }
}

provider "yandex" {
}

data "yandex_compute_image" "container-optimized-image" {
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "this" {
  platform_id = "standard-v3"
  zone        = var.zone
  folder_id   = var.folder_id

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    docker-compose = file("${path.root}/../docker-compose.yaml")
    user-data = templatefile("cloud_config.tpl", {
      SSH_KEY = var.ssh_key
    })
  }
}


