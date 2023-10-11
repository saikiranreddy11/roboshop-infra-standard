locals {
    database_cidr_block = split(",",data.aws_ssm_parameter.database_subnets.value)
   
    ami_id = data.aws_ami.devops_ami.id
}

