
data "aws_ssm_parameter" "public_subnets" {
  name = "/roboshop/dev/public_subnet_cidr" 
}
data "aws_ssm_parameter" "web_layer_LB_sg_id" {
  name = "/roboshop/dev/web_layer_LB_sg_id" 
}
data "aws_route53_zone" "domain_name" {
  name         = "saikiransudhireddy.com"
  private_zone = false
}