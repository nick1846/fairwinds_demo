#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo yum install -y  python3-pip
python3 -m pip install --user --upgrade pip 
python3 -m pip install ansible











