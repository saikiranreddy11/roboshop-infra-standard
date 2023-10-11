# module "sg" {
#     source= "../../terraform-SG-module"
#     #ingress_rules = local.ingress_rules
#     sg_name = var.sg_name
#     sg_description = var.sg_description 
#     vpc_id = local.vpc_id
#     common_tags = var.common_tags
#     projectname = var.projectname

# }

# resource "aws_security_group_rule" "allow_myip"{
#     type = "ingress"
#     description      = "Inbound rule to allow all traffic from vpn instance with vpn_sg_id"
#     from_port        = 0
#     to_port          = 0
#     protocol         = "all"
#     source_security_group_id      = data.aws_ssm_parameter.vpn_sg_id.value
#     security_group_id = module.sg.sg_id
# }
