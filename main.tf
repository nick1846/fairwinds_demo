provider "aws" {
  region = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_key" {
  key_name   = var.my_key_name
  public_key = tls_private_key.key.public_key_openssh
}


# resource "aws_key_pair" "ec2-user-public" {
#   key_name   = var.my_key_name
#   public_key = var.my_publickey
# }

resource "aws_eip" "django_server" {
  count    = var.eip_count
  vpc      = var.vpc_bool
  instance = element(module.my_ec2.*.id, count.index)
}

module "my_vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.my_vpc_name
  cidr            = var.my_vpc_cidr
  azs             = var.my_vpc_azs
  private_subnets = var.my_vpc_private_subnets
  public_subnets  = var.my_vpc_public_subnets

}


module "my_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  name                = var.my_sg_name
  description         = var.sg_description
  vpc_id              = module.my_vpc.vpc_id
  ingress_cidr_blocks = var.sg_ingress_cidr
  ingress_rules       = var.sg_ingress_rules
  egress_cidr_blocks  = var.sg_egress_cidr
  egress_rules        = var.sg_egress_rules
}

module "my_ec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = var.my_ec2_name
  key_name               = var.my_key_name
  count                  = var.ec2_count
  ami                    = data.aws_ami.my_ami.id
  instance_type          = var.ec2_type
  vpc_security_group_ids = [module.my_sg.security_group_id]
  subnet_id              = element(module.my_vpc.public_subnets, 0)
  user_data              = file("userdata.sh")
  tags                   = var.ec2_tags
}

data "aws_ami" "my_ami" {
  most_recent = var.most_recent_bool
  filter {
    name   = var.ami_tag_type
    values = var.ami_value
  }
  owners = var.ami_owner
}

output "django_server_eip" {
  description = "Elastic ip address for Django-servers"
  value       = aws_eip.django_server.*.public_ip
}

resource "null_resource" "provision_django" {

  connection {
    host        = element(module.my_ec2.*.public_ip, 0)
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.key.private_key_pem

  }
  
  provisioner "file" {
    source      = "ansible/playbooks"
    destination = "/home/ec2-user"
  }

  provisioner "remote-exec" {

    inline = [
      "ansible-playbook /home/ec2-user/playbooks/django_server.yaml",
    ]
  }


}