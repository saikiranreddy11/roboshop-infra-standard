data "aws_ssm_parameter" "app_layer_lb" {
  name = "/roboshop/dev/app_layer_sg_id" 
}



data "aws_route53_zone" "domain_name" {
  name         = "saikiransudhireddy.com"
  private_zone = false
}
# data "aws_autoscaling_group" "fetching_instances_id" {
#   name = "catalogue_autoscaling_grp"
# }

data "aws_ssm_parameter" "private_subnets" {
  name = "/roboshop/dev/private_subnet_cidr" 
}
