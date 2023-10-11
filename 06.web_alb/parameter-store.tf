resource "aws_ssm_parameter" "web_alb_listener_arn" {
  name  = "/${var.projectname}/${var.env}/web_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.web_alb_listener.arn
}