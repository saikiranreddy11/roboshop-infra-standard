data "aws_ssm_parameter" "database_subnets" {
  name = "/roboshop/dev/database_subnet_cidr" 
}

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

data "aws_route53_zone" "domain_name" {
  name         = "saikiransudhireddy.com"
  private_zone = false
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/roboshop/dev/rabbitmq_sg_id" 
}