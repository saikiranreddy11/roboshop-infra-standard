data "aws_ssm_parameter" "vpc_id" {
  name = "/roboshop/dev/vpc_id"

}

data "aws_vpc" "vpn_vpcid" {

  filter {
    name   = "cidr"
    values = ["10.40.0.0/16"]  # Replace with the desired CIDR block
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
