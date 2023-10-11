locals{
# myip= "${chomp(data.http.myip.body)}"
 
 #sg_id = module.sg.sg_id #the last sg_id is the name of the output variable which is sent from the Security Group module
  ami_id = data.aws_ami.devops_ami.id
}