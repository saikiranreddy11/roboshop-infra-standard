module "redis" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "redis"
    ami = "${local.ami_id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
   subnet_id              = local.database_cidr_block[0]
   user_data = file("./redis.sh")
    instance_tags = merge({ 
        "Name" = "redis"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

resource "aws_route53_record" "app_record" {
  zone_id =  data.aws_route53_zone.domain_name.id
   name    = "redis.saikiransudhireddy.com"
  type    = "A"
  ttl = 300
  records = [module.redis.private_ip]
}

