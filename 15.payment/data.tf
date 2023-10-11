data "aws_ami" "devops_ami" {
 
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "public_subnets" {
  name = "/roboshop/dev/public_subnet_cidr" 
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/roboshop/dev/catalogue_sg_id" 
}
data "aws_ssm_parameter" "private_subnets" {
  name = "/roboshop/dev/private_subnet_cidr" 
}

# data "aws_ssm_parameter" "targetgroup" {
#   name  = "/roboshop/dev/web/target-group-arn"

# }

data "aws_ssm_parameter" "roboshop_vpcid" {
  name = "/roboshop/dev/vpc_id" 
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/roboshop/dev/payment_sg_id" 
}

data "aws_ssm_parameter" "app_alb_listener_arn" {
  name = "/roboshop/dev/app_alb_listener_arn" 
}
