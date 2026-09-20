variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"

}

variable "instance_types" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = list(string)
  default = ["webserver1", "webserver2", "webserver3"]


}

variable "security_group_name" {
  type    = list(string)
  default = ["web_sg1", "web_sg2", "web_sg3"]
}

variable "tags" {
  type = map(string)
  default = {
    Name = "webserver"
    env  = "test"
  }
}

variable "environment" {
  type    = string
  default = "test"

  validation {
    condition     = contains(["test", "stage", "prod"], var.environment)
    error_message = "Environment must be one of the following: test, stage, prod"
  }
}