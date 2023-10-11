locals{

  ami_id = data.aws_ami.devops_ami.id
  vpc_id = module.vpc.vpc.id
   #vpn_sg_id= data.aws_ssm_parameter.vpn_sg_id
   public_subnet_ids = module.vpc.public_subnet_id[*]
    private_subnet_ids = module.vpc.private_subnet_id[*]
    database_subnet_ids = module.vpc.database_subnet_id[*]
}