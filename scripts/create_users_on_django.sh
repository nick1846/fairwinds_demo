#! /bin/bash

MY_IP=$(cat ../terraform/public_ip)

if grep -Fxq "$MY_IP" ../ansible/linux_users/hosts
then
    echo "exists"
else
    cat ../terraform/public_ip > ../ansible/linux_users/hosts
    cat <(echo '[django-server]') ../terraform/public_ip > ../ansible/linux_users/hosts
fi

(cd ../ansible/linux_users/; ansible-playbook --private-key ../../terraform/ec2_keys/mykey_rsa -i hosts main.yaml)
exec bash