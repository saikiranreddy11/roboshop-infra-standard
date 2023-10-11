locals {
    public_cidr_block = split(",",data.aws_ssm_parameter.public_subnets.value)
    private_cidr_block = split(",",data.aws_ssm_parameter.private_subnets.value)
}

