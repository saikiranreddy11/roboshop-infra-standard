data "aws_ssm_parameter" "roboshop_vpcid" {
  name = "/roboshop/dev/vpc_id" 
}

data "aws_ssm_parameter" "web_alb_listener_arn" {
  name = "/roboshop/dev/web_alb_listener_arn" 
}
