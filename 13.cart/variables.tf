variable "projectname"{
    default = "roboshop"
}

variable "component"{
    default = "cart"
}

variable "image_id"{
    default = ""
}
variable "instance_type"{
    default = "t2.micro"
}

variable "launch_template_tags"{
    default =[
        {
         resource_type = "instance"
      tags =  {
           "Name" = "cart"

        }
        },{
            resource_type= "volume"
      tags =  {
           "Name" = "cart"

      }
        }
    ]
}
variable "max_size"{
    default = 10
}

variable "min_size"{
    default = 1
}

variable "health_check_grace_period"{
    default =660
}

variable "health_check_type"{
    default = "ELB"
}

variable "desired_capacity"{
    default = 2
}

variable "auto_scaling_cpu_target_value"{
    default = 70
}


variable "target_group_port"{
    default = "8080"
}

variable "target_group_protocol"{
default = "HTTP"
}
variable "health_check"{
    default = {
         enabled = true
    path                = "/health"  # The path to check on the instances
    port                = "8080"       # The port to use for the health check
    protocol            = "HTTP"     # The protocol to use for the health check
    interval            = 30         # The interval between health checks (in seconds)
    timeout             = 5          # The amount of time to wait for a response (in seconds)
    healthy_threshold   = 2          # Number of consecutive successful checks for an instance to be considered healthy
    unhealthy_threshold = 2  
    matcher = "200-299"
    }
}

variable "rule_priority"{
    default = 110
}

variable "host_header"{
    default ="cart.app.saikiransudhireddy.com"
}

variable "action_type"{
    default ="forward"
}
variable "common_tags"{
    default={
    project = "roboshop"
    environment = "development"
    terraform = "true"
    component = "cart"
    }
}


variable "auto_scaling_tags"{
    default = [
        {
            key = "Name"
            value = "cart"
            propagate_at_launch = "true"
        },
        {
            key = "project"
            value = "roboshop"
            propagate_at_launch = "true"
        }
    ]
}