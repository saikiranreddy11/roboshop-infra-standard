# module "sg" {
#     source= "../../terraform-SG-module"
#     #ingress_rules = local.ingress_rules
#     sg_name = var.sg_name
#     sg_description = var.sg_description 
#     vpc_id = data.aws_vpc.vpn_vpcid.id
#     common_tags = var.common_tags
#     projectname = var.projectname

# }

# resource "aws_security_group_rule" "allow_myip"{
#     type = "ingress"
#     description      = "Inbound rule to allow all traffic from myip"
#     from_port        = 0
#     to_port          = 0
#     protocol         = "all"
#     cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
#     security_group_id = module.sg.sg_id
    
    
# }