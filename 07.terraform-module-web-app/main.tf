resource "aws_lb_target_group" "main" {
  name     = "${var.projectname}-${var.common_tags.component}-tg"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
   health_check {
    enabled = var.health_check.enabled
    path                = var.health_check.path  # The path to check on the instances
    port                = var.health_check.port       # The port to use for the health check
    protocol            = var.health_check.protocol    # The protocol to use for the health check
    interval            = var.health_check.interval      # The interval between health checks (in seconds)
    timeout             = var.health_check.timeout       # The amount of time to wait for a response (in seconds)
    healthy_threshold   = var.health_check.healthy_threshold        # Number of consecutive successful checks for an instance to be considered healthy
    unhealthy_threshold =  var.health_check.unhealthy_threshold         # Number of consecutive failed checks for an instance to be considered unhealthy
    matcher = var.health_check.matcher
  }
}


resource "aws_launch_template" "main" {
  name = "${var.projectname}-${var.component}"

  image_id = var.image_id

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type

  vpc_security_group_ids = [var.vpc_security_group_ids]

  dynamic tag_specifications {
    for_each = var.launch_template_tags
    content{
         resource_type = tag_specifications.value["resource_type"]

    tags = tag_specifications.value["tags"]
    }
   
    }
    user_data = var.user_data
  }

  


resource "aws_autoscaling_group" "main" {
  name                      = "${var.projectname}-${var.component}"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = true
  target_group_arns = [aws_lb_target_group.main.arn]
  launch_template{
    id = aws_launch_template.main.id
    version = "$Latest"
  }
  vpc_zone_identifier       = var.vpc_zone_identifier
  dynamic tag{
    for_each = var.auto_scaling_tags
    content{
      key = tag.value["key"]
      value = tag.value["value"]
      propagate_at_launch = tag.value["propagate_at_launch"]
    }

  }

}

resource "aws_autoscaling_policy" "main" {
  autoscaling_group_name = aws_autoscaling_group.main.name
  name                   = "${var.projectname}-${var.component}-policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.auto_scaling_cpu_target_value
    
  }
}




resource "aws_lb_listener_rule" "main" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = var.action_type
    target_group_arn = aws_lb_target_group.main.arn
  }

  # condition {
  #   path_pattern {
  #     values = ["categories"]
  #   }
  # }

  condition {
    host_header {
      values = [var.host_header]
    }
  }
}
