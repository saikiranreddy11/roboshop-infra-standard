locals{
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    vpn_vpcid = data.aws_vpc.vpn_vpcid.id
}