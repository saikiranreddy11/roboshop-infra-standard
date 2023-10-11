
module "vpn" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "vpn-sg"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpn_vpcid
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "vpn_sg"
        component = "vpn"

    })

}

module "mongodb" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "mongodb"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "mongodb_sg"
        component = "mongodb"

    })

}

module "redis" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "redis-sg"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "redis_sg"
        component = "redis"

    })

}
module "mysql" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "mysql-sg"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "mysql_sg"
        component = "mysql"

    })

}
module "rabbitmq" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "rabbitmq-sg"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "rabbitmq_sg"
        component = "rabbitmq"

    })

}

module "catalogue" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "catalogue"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "catalogue_sg"
        component = "catalogue"

    })

}

module "cart" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "cart"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "cart_sg"
        component = "cart"

    })

}
module "user" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "user"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "user_sg"
        component = "user"

    })

}
module "shipping" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "shipping"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "shipping_sg"
        component = "shipping"

    })

}
module "payment" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "payment"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "payment_sg"
        component = "payment"

    })

}


module "app_layer_LB" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "app_layer_LB"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "app_layer_LB"
        component = "Load balancer"

    })

}

module "web" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "web"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "web_sg"
        component = "web"

    })

}
module "web_layer_LB" {
    source= "../../terraform-SG-module"
    #ingress_rules = local.ingress_rules
    sg_name = "Web_layer_LB"
    sg_description = "allowing traffic from ...." 
    vpc_id = local.vpc_id
    projectname = var.projectname
    common_tags = merge(var.common_tags,
    {
        Name = "Web_layer_LB_SG"
        component = "LOad balancer"

    })

}



resource "aws_security_group_rule" "vpn_to_myip"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic fromm....."
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
    security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "mongodb_to_catalogue"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 27017 from catalogue"
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    security_group_id = module.mongodb.sg_id
    source_security_group_id = module.catalogue.sg_id
}

resource "aws_security_group_rule" "mongodb_to_cart"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 27017 from catalogue"
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    security_group_id = module.mongodb.sg_id
    source_security_group_id = module.cart.sg_id
}

resource "aws_security_group_rule" "mongodb_to_user"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 27017 from catalogue"
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    security_group_id = module.mongodb.sg_id
    source_security_group_id = module.user.sg_id
}


resource "aws_security_group_rule" "mongodb_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.mongodb.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "redis_to_cart"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 6379 from cart"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    security_group_id = module.redis.sg_id
    source_security_group_id = module.cart.sg_id
}

resource "aws_security_group_rule" "redis_to_catalogue"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 6379 from catalogue"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    security_group_id = module.redis.sg_id
    source_security_group_id = module.catalogue.sg_id
}

resource "aws_security_group_rule" "redis_to_user"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 6379 from user"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    security_group_id = module.redis.sg_id
    source_security_group_id = module.user.sg_id
}

resource "aws_security_group_rule" "redis_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.redis.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "mysql_to_shipping"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 3306 from shipping"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_group_id = module.mysql.sg_id
    source_security_group_id = module.shipping.sg_id
}

resource "aws_security_group_rule" "mysql_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.mysql.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "rabbitmq_to_payments"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 5672 from payments"
    from_port        = 5672
    to_port          = 5672
    protocol         = "tcp"
    security_group_id = module.rabbitmq.sg_id
    source_security_group_id = module.payment.sg_id
}

resource "aws_security_group_rule" "rabbitmq_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.rabbitmq.sg_id
    source_security_group_id = module.vpn.sg_id
}


resource "aws_security_group_rule" "catalogue_to_app_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from app_layer_LB"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.catalogue.sg_id
    source_security_group_id = module.app_layer_LB.sg_id
}

resource "aws_security_group_rule" "catalogue_to_cart"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from cart"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.catalogue.sg_id
    source_security_group_id = module.cart.sg_id
}

resource "aws_security_group_rule" "catalogue_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.catalogue.sg_id
    source_security_group_id = module.vpn.sg_id
}
resource "aws_security_group_rule" "cart_to_app_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from app_layer_LB"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.cart.sg_id
    source_security_group_id = module.app_layer_LB.sg_id
}
resource "aws_security_group_rule" "cart_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.cart.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "user_to_app_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from app_layer_LB"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.user.sg_id
    source_security_group_id = module.app_layer_LB.sg_id
}
resource "aws_security_group_rule" "user_t0_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.user.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "shipping_to_app_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from app_layer_LB"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.shipping.sg_id
    source_security_group_id = module.app_layer_LB.sg_id
}

resource "aws_security_group_rule" "shipping_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.shipping.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "payment_to_app_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 8080 from app_layer_LB"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    security_group_id = module.payment.sg_id
    source_security_group_id = module.app_layer_LB.sg_id
}

resource "aws_security_group_rule" "payment_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.payment.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "app_layer_LB_to_web"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from web"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.app_layer_LB.sg_id
    source_security_group_id = module.web.sg_id
}

resource "aws_security_group_rule" "app_layer_LB_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from vpn"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.app_layer_LB.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "app_layer_LB_to_cart"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from cart"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.app_layer_LB.sg_id
    source_security_group_id = module.cart.sg_id
}

resource "aws_security_group_rule" "app_layer_LB_to_shipping"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from shipping"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.app_layer_LB.sg_id
    source_security_group_id = module.shipping.sg_id
}

resource "aws_security_group_rule" "app_layer_LB_to_payment"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from payment"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.app_layer_LB.sg_id
    source_security_group_id = module.payment.sg_id
}

resource "aws_security_group_rule" "web_to_web_layer_LB"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from web_layer_LB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.web.sg_id
    source_security_group_id = module.web_layer_LB.sg_id
}

resource "aws_security_group_rule" "web_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from vpn"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_group_id = module.web.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "web_to_vpn_port22"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 22 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.web.sg_id
    source_security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "web_layer_LB_to_internet"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from internet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_group_id = module.web_layer_LB.sg_id
    cidr_blocks = ["0.0.0.0/0"]
}

# resource "aws_security_group_rule" "web_layer_LB_to_internet_80"{
#     type = "ingress"
#     description      = "Inbound rule to allow all traffic from internet"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     security_group_id = module.web_layer_LB.sg_id
#     cidr_blocks = ["0.0.0.0/0"]
# }



resource "aws_security_group_rule" "web_layer_LB_to_vpn"{
    type = "ingress"
    description      = "Inbound rule to allow all traffic from port 80 from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_group_id = module.web_layer_LB.sg_id
    source_security_group_id = module.vpn.sg_id
}


