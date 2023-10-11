variable "common_tags"{
    default={
    project = "roboshop"
    environment = "development"
    terraform = "true"
    }
}

variable "projectname"{
    default ="roboshop"
}

variable "env"{
    default ="dev"
}