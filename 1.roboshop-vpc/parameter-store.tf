resource "aws_ssm_parameter" "vpcid" {
  name  = "/${var.projectname}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc.id
}

resource "aws_ssm_parameter" "public_subnet_cidr" {
  name  = "/${var.projectname}/${var.env}/public_subnet_cidr"
  type  = "StringList"
  value = join(",", module.vpc.public_subnet_id[*])
}

resource "aws_ssm_parameter" "private_subnet_cidr" {
  name  = "/${var.projectname}/${var.env}/private_subnet_cidr"
  type  = "StringList"
  value = join(",", module.vpc.private_subnet_id[*])
}

resource "aws_ssm_parameter" "database_subnet_cidr" {
  name  = "/${var.projectname}/${var.env}/database_subnet_cidr"
  type  = "StringList"
  value = join(",", module.vpc.database_subnet_id[*])
}


resource "aws_ssm_parameter" "peering_id" {
  name  = "/${var.projectname}/${var.env}/peering_id"
  type  = "StringList"
  value = join(",",module.vpc.peering_id[*])
}

resource "aws_ssm_parameter" "cidr_block" {
  name  = "/${var.projectname}/${var.env}/cidr_block"
  type  = "String"
  value = module.vpc.vpc.cidr_block
}

# resource "aws_ssm_parameter" "sg_id" {
#   name  = "/${var.projectname}/${var.env}/sg_id"
#   type  = "String"
#   value = module.sg.sg_id
# }
