#! /bin/bash
cd ../terraform/
terraform init
terraform apply -auto-approve -var-file=values.tfvars
exec bash