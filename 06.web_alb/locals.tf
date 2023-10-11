locals {
    public_cidr_block = split(",",data.aws_ssm_parameter.public_subnets.value)
}

