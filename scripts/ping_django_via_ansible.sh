#! /bin/bash

(cd ../ansible/ping_dynamic/; ansible-playbook --private-key ../../terraform/ec2_private_key/ec2_private_key.pem -i django_aws_ec2.yaml ping.yaml)
exec bash