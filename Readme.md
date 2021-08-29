#  Quickstart Guide 

This is my simple dockerized django server, which you can run in AWS via Terraform.
Prerequisites installed on your local machine:
    - Terraform
    - Ansible
    - The aws_ec2 dynamic inventory plugin requires boto3 and botocore.

Before you start set desired AWS region (and azs) in templates and AWS credentials (either in templates or shell commands):
      $ export AWS_ACCESS_KEY_ID="anaccesskey"
      $ export AWS_SECRET_ACCESS_KEY="asecretkey"

To deploy django server run commands locally:
      $ git clone https://github.com/nick1846/fairwinds_demo.git
      $ cd fairwinds_demo/scripts
      $ bash deploy_django.sh
 
Use IP from output in the console to see django app in the browser. Wait until instance up and running (around 5 mimutes, ansible in action)

To ping the server via Ansible run: 
      $ bash ping_django_via_ansible.sh
     
Don't forget destroy everything by running:
      $ bash destroy_django.sh
     
      Good luck!

