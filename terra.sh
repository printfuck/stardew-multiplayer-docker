#!/bin/sh

# Generate SSH keys
ssh-keygen -f terraform/ssh/key -q -P ""

# Run Terraform
cd terraform
terraform init
terraform apply
