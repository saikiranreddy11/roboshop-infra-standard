resource "aws_lb" "app_alb" {
  name               = "app-layer-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_layer_lb.value]
  subnets            = local.private_cidr_block

  #enable_deletion_protection = true


  tags = {
    Name = "web_alb"
    Environment = "dev"
    project = "roboshop"
    component = "public"
  }
}

resource "aws_lb_listener" "app_alb_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello, you have hit the application layer load balancer"
      status_code  = "200"
    }
  }
}



resource "aws_route53_record" "app_record" {
  zone_id =  data.aws_route53_zone.domain_name.id
   name    = "*.app.saikiransudhireddy.com"
  type    = "A"

  alias {
    name                   = aws_lb.app_alb.dns_name
    zone_id                = aws_lb.app_alb.zone_id
    evaluate_target_health = true
  }
}