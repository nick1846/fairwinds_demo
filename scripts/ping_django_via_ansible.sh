#! /bin/bash

chmod 600 ../terraform/aws_private_key/aws_private_key.txt
(cd ../ansible/ping_dynamic/; ansible-playbook --private-key ../../terraform/aws_private_key/aws_private_key.txt -i django_aws_ec2.yaml ping.yaml)
exec bash