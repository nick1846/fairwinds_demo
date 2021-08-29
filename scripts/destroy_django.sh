#! /bin/bash
(cd ../terraform/; terraform destroy -auto-approve -var-file=values.tfvars)
exec bash