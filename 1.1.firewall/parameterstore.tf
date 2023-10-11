resource "aws_ssm_parameter" "vpn_sg_id" {
  name  = "/${var.projectname}/${var.env}/vpn_sg_id"
  type  = "String"
  value = module.vpn.sg_id
}

resource "aws_ssm_parameter" "mongodb" {
  name  = "/${var.projectname}/${var.env}/mongodb_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
}
resource "aws_ssm_parameter" "redis_sg_id" {
  name  = "/${var.projectname}/${var.env}/redis_sg_id"
  type  = "String"
  value = module.redis.sg_id
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.projectname}/${var.env}/mysql_sg_id"
  type  = "String"
  value = module.mysql.sg_id
}

resource "aws_ssm_parameter" "rabbitmq_sg_id" {
  name  = "/${var.projectname}/${var.env}/rabbitmq_sg_id"
  type  = "String"
  value = module.rabbitmq.sg_id
}

resource "aws_ssm_parameter" "catalogue" {
  name  = "/${var.projectname}/${var.env}/catalogue_sg_id"
  type  = "String"
  value = module.catalogue.sg_id
}
resource "aws_ssm_parameter" "app_layer_LB_sg" {
  name  = "/${var.projectname}/${var.env}/app_layer_sg_id"
  type  = "String"
  value = module.app_layer_LB.sg_id
}

resource "aws_ssm_parameter" "web_sg" {
  name  = "/${var.projectname}/${var.env}/web_sg_id"
  type  = "String"
  value = module.web.sg_id
}


resource "aws_ssm_parameter" "web_layer_LB_sg_id" {
  name  = "/${var.projectname}/${var.env}/web_layer_LB_sg_id"
  type  = "String"
  value = module.web_layer_LB.sg_id
}


resource "aws_ssm_parameter" "cart_sg_id" {
  name  = "/${var.projectname}/${var.env}/cart_sg_id"
  type  = "String"
  value = module.cart.sg_id
}

resource "aws_ssm_parameter" "user_sg_id" {
  name  = "/${var.projectname}/${var.env}/user_sg_id"
  type  = "String"
  value = module.user.sg_id
}

resource "aws_ssm_parameter" "shipping_sg_id" {
  name  = "/${var.projectname}/${var.env}/shipping_sg_id"
  type  = "String"
  value = module.shipping.sg_id
}

resource "aws_ssm_parameter" "payment_sg_id" {
  name  = "/${var.projectname}/${var.env}/payment_sg_id"
  type  = "String"
  value = module.payment.sg_id
}
