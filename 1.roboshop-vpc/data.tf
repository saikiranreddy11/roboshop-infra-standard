data "aws_vpc" "vpn_vpcid" {

  filter {
    name   = "cidr"
    values = ["10.40.0.0/16"]  # Replace with the desired CIDR block
  }
}

output "vpn_id"{
    value = data.aws_vpc.vpn_vpcid
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

# data "aws_ssm_parameter" "vpn_sg_id" {
#   name = "/vpn/dev/vpn_sg_id"   #the resources are not getting deleted when there is a dependency on parameter which is deleted from the parameter store

# }

# output "vpn_sg_id"{
#     value = data.aws_ssm_parameter.vpn_sg_id
#     sensitive = true
# }