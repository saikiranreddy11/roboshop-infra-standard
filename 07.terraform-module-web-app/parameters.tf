# resource "aws_ssm_parameter" "targetgroup"{
#   name  = "/${var.projectname}/${var.env}/${var.component}/target-group-arn"
#   type  = "String"
#   value = aws_lb_target_group.main.arn
# }
