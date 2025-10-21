#!/bin/bash

set -e
echo "====== Infra Terraform====="
cd ./terraform
terraform init
terraform apply -auto-approve

echo "=====Ansible work======"
cd ../ansible
ansible-playbook -i inventory.ini playbook.yaml

echo "======Deploing completed"