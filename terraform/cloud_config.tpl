#cloud-config
ssh_pwauth: no
users:
  - name: yc-user
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    groups: sudo, docker
    ssh-authorized-keys:
      - "${SSH_KEY}"
