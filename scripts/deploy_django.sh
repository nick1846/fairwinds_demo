#! /bin/bash

if [ -d ../terraform/ec2_keys ]
then
    echo "exists"
else
    mkdir ../terraform/ec2_keys
    yes "n" | ssh-keygen -m pem -N "" -f ../terraform/ec2_keys/mykey_rsa
fi

cp -f ../terraform/ec2_keys/mykey_rsa.pub ../ansible/linux_users/files

(cd ../terraform/; terraform init)
(cd ../terraform/; terraform apply -auto-approve -var-file=values.tfvars)
exec bash