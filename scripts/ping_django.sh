#! /bin/bash

(cd ../ansible/ping_dynamic/; ansible-playbook --private-key ../../terraform/ec2_keys/mykey_rsa -i django_aws_ec2.yaml ping.yaml)
exec bash 