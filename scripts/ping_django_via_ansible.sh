#! /bin/bash
chmod 600 ../terraform/aws_private_key/aws_private_key.txt
ansible-playbook --private-key ../terraform/aws_private_key/aws_private_key.txt -i ../ansible/ansible-dynamic-aws-inventory/my_web_aws_ec2.yaml ../ansible/ansible-dynamic-aws-inventory/ping.yaml
exec bash