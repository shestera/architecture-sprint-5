# architecture-sprint-5

## Настройка terraform

[Установите Terraform](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart#install-terraform)

Создайте файл ~/.terraformrc

```hcl
provider_installation {
  network_mirror {
    url = "<https://terraform-mirror.yandexcloud.net/>"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```

## Добавляем переменные яндекс облака

terraform/terraform.tfvars

```bash
ssh_key   = "ssh key"
zone      = "ru-central1-a"
subnet_id = "subnet-id зоны ru-central1-a"
folder_id = "folder-id"
```

## Применяем terraform конфигурацию

```bash
cd terraform
export YC_TOKEN="<OAuth-токен>"
terraform apply
```
