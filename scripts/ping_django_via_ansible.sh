#! /bin/bash

chmod 600 ../terraform/aws_private_key/aws_private_key.txt
(cd ../ansible/ansible-dynamic-aws-inventory/; ansible-playbook --private-key ../../terraform/aws_private_key/aws_private_key.txt -i django_aws_ec2.yaml ping.yaml)
exec bash