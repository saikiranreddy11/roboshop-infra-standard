module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "mongodb"
    ami = "${local.ami_id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongo_sg_id.value]
   subnet_id              = local.database_cidr_block[0]
   user_data = file("./user.sh")
    instance_tags = merge({
        "Name" = "mongodb"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

resource "aws_route53_record" "app_record" {
  zone_id =  data.aws_route53_zone.domain_name.id
   name    = "mongodb.saikiransudhireddy.com"
  type    = "A"
  ttl = 300
  records = [module.mongodb.private_ip]
}

