module "cart"{
    source ="../07.terraform-module-web-app"

     #aws_lb target group 
    target_group_port = var.target_group_port
    target_group_protocol = var.target_group_protocol
    vpc_id = data.aws_ssm_parameter.roboshop_vpcid.value
    health_check = var.health_check 
    common_tags = var.common_tags

    #launch_template
    projectname = var.projectname
    component = var.component
   image_id = data.aws_ami.devops_ami.id
   vpc_security_group_ids = data.aws_ssm_parameter.cart_sg_id.value
    user_data = filebase64("${path.module}/cart.sh")
    instance_type = var.instance_type
    launch_template_tags = var.launch_template_tags
  #   #autoscaling_grp
    max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
   
    vpc_zone_identifier       = local.private_cidr_block
    auto_scaling_tags = var.auto_scaling_tags


    #autoscaling policy(completely optional)
    auto_scaling_cpu_target_value = var.auto_scaling_cpu_target_value

   

    #aws_lb listener rule
    listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
    priority = var.rule_priority
    action_type = var.action_type
    host_header = var.host_header
}
