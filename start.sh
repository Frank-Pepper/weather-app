#!/bin/bash
terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve

IP_ADDRESS=$(cat ./terraform/terraform.tfstate | grep public_ip | cut -d'"' -f 4)
echo $IP_ADDRESS
ANSIBLE_INVENTORY=./ansible/inventory
SETUP_PLAYBOOK=./ansible/playbook.yml
COMPOSE_PLAYBOOK=./ansible/run_docker.yml
ANSIBLE_DATA=$(awk 'NR == 2 {print $2, $3, $4, $5}' $ANSIBLE_INVENTORY)

echo $(head -1 $ANSIBLE_INVENTORY) > $ANSIBLE_INVENTORY
echo $IP_ADDRESS $ANSIBLE_DATA >> $ANSIBLE_INVENTORY

# # ansible-playbook -i ./ansible/inventory ./ansible/playbook.yml -u ubuntu
# ansible-playbook -i $ANSIBLE_INVENTORY $SETUP_PLAYBOOK -u ubuntu

# # ansible-playbook -i ./ansible/inventory ./ansible/run_docker.yml  -u ubuntu
# ansible-playbook -i $ANSIBLE_INVENTORY $COMPOSE_PLAYBOOK -u ubuntu