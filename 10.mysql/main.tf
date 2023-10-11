module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "mysql"
    ami = "${local.ami_id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg_id.value]
   subnet_id              = local.database_cidr_block[0]
   user_data = file("./mysql.sh")
    instance_tags = merge({
        "Name" = "mysql"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

resource "aws_route53_record" "app_record" {
  zone_id =  data.aws_route53_zone.domain_name.id
   name    = "mysql.saikiransudhireddy.com"
  type    = "A"
  ttl = 300
  records = [module.mysql.private_ip]
}

