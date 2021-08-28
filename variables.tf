#my-aws-credentials-variables
# variable "aws_access_key" {
# }

# variable "aws_secret_key" {
# }

variable "aws_region" {
}

#key-pair variables

variable "my_key_name" {
}


#my-eip-variables

variable "eip_count" {
}

variable "vpc_bool" {
}

#my-vpc-variables

variable "my_vpc_name" {
}

variable "my_vpc_cidr" {
}

variable "my_vpc_azs" {
}

variable "my_vpc_private_subnets" {
}

variable "my_vpc_public_subnets" {
}



#my-sg-variables

variable "my_sg_name" {
}

variable "sg_description" {
}

variable "sg_ingress_cidr" {
}

variable "sg_ingress_rules" {
}

variable "sg_egress_cidr" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_egress_rules" {
}

#my-ec2-variables

variable "my_ec2_name" {
}

variable "ec2_count" {
}

variable "ec2_type" {
}

variable "ec2_tags" {
}

#my-data-ami

variable "most_recent_bool" {
}

variable "ami_tag_type" {
}

variable "ami_value" {
}

variable "ami_owner" {
}
