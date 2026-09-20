variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"

}

variable "instance_types" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "webserver"

  validation {
    condition     = contains(["webserver", "appserver", "dbserver"], var.instance_name)
    error_message = "Instance name must be one of the following: webserver, appserver, dbserver"
  }
}

variable "security_group_name" {
  type    = string
  default = "web_sg"
}

variable "tags" {
  type = map(string)
  default = {
    Name = "webserver"
    env  = "test"
  }
}