resource "aws_route" "peering_route" {
    for_each = data.aws_route_table.rt
  route_table_id            = data.aws_route_table.rt[each.key].id  # Replace with your actual route table ID
   destination_cidr_block   = data.aws_ssm_parameter.cidr_block.value# Replace with the CIDR block of the peer VPC
    vpc_peering_connection_id = data.aws_ssm_parameter.peering_id.value  # Replace with your VPC peering connection ID
}


module "vpn_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "vpn"
    ami = local.ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
 subnet_id              = "subnet-056c011dcadbb4283"
    instance_tags = merge({
        "Name" = "vpn-instance"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

