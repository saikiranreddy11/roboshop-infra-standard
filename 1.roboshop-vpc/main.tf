module "vpc"{
    source ="../../terraform-vpc-advanced"
    vpc_cidr_block = var.vpc_cidr_block
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
     gw_tags = var.gw_tags
    # az = var.az
    projectname= var.projectname
    public_cidr_block = var.public_cidr_block
    private_cidr_block = var.private_cidr_block
    database_cidr_block = var.database_cidr_block

    #peering connection
    peer_vpc_id = data.aws_vpc.vpn_vpcid.id
    peer_cidr_block = data.aws_vpc.vpn_vpcid.cidr_block
    is_peering_connection = var.is_peering_connection
}

