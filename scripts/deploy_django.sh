#! /bin/bash

(cd ../terraform/; terraform init)
(cd ../terraform/; terraform apply -auto-approve -var-file=values.tfvars)
exec bash