
variable "projectname"{
    default ="vpn"
}
variable "env"{
    default ="dev"
}
variable "common_tags"{
    default={
    project = "roboshop"
    environment = "development"
    terraform = "true"
    }
}



variable "sg_name"{
    default = "vpn"
}
variable "sg_description"{
    default = "allowing the traffic from all the ports from my IP "
}


# variable "ingress_rules"{
#     default = [
#         {
#     description      = "Inbound rule to allow HTTPS traffic"
#     from_port        = 0
#     to_port          = 0
#     protocol         = "all"
#     cidr_blocks      = [""]
    
#        }
    #     {
    # description      = "Inbound rule to allow HTTP traffic"
    # from_port        = 80
    # to_port          = 80
    # protocol         = "tcp"
    # cidr_blocks      = ["0.0.0.0/0"]

    #     },
    #     {
    # description      = "Inbound rule to allow SSH traffic"
    # from_port        = 22
    # to_port          = 22
    # protocol         = "tcp"
    # cidr_blocks      = ["0.0.0.0/0"]
    #     }
#      ]
# }
