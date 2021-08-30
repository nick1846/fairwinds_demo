#! /bin/bash
echo "" > ../ansible/linux_users/hosts
rm -rf ../ansible/linux_users/files/mykey_rsa.pub
(cd ../terraform/; terraform destroy -auto-approve -var-file=values.tfvars)
rm -rf ../terraform/ec2_keys
exec bash