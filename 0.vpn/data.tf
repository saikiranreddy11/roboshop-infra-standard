data "aws_vpc" "vpn_vpcid" {

  filter {
    name   = "cidr"
    values = ["10.40.0.0/16"]  # Replace with the desired CIDR block
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpn_vpcid.id]
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.example : s.cidr_block]
}


data "aws_route_tables" "rts" {
  vpc_id = data.aws_vpc.vpn_vpcid.id
  # filter {
  #   name   = "tag:kubernetes.io/kops/role"
  #   values = ["private*"]
  # }
}

data "aws_route_table" "rt" {
  for_each = toset(data.aws_route_tables.rts.ids)
  route_table_id       = each.value
}

output "all_rt" {
  #value = [for s in data.aws_subnet.example : s.cidr_block]
  value = [for s in data.aws_route_table.rt : s.id]
}

data "aws_ssm_parameter" "peering_id" {
  name = "/roboshop/dev/peering_id"
 
}

output "peer_id"{
  value = data.aws_ssm_parameter.peering_id
  sensitive = true
}   

data "aws_ssm_parameter" "vpc_id" {
  name = "/roboshop/dev/vpc_id"

}

data "aws_ssm_parameter" "cidr_block" {
  name = "/roboshop/dev/cidr_block"

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

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/roboshop/dev/vpn_sg_id"

}