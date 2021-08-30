#! /bin/bash
mkdir ../terraform/ec2_private_key
yes "n" | ssh-keygen -m pem -N "" -f ../terraform/ec2_private_key/mykey_rsa
(cd ../terraform/; terraform init)
(cd ../terraform/; terraform apply -auto-approve -var-file=values.tfvars)
exec bash