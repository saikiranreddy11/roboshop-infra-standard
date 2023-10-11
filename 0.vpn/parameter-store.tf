# resource "aws_ssm_parameter" "vpn_sg_id" {
#   name  = "/${var.projectname}/${var.env}/vpn_sg_id"
#   type  = "String"
#   value = module.sg.sg_id
# }
