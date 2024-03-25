variable "ec2_ami" {
type = string
default = "ami-023adaba598e661ac"
}
variable "ec2_type" {
type = string
default = "t2.micro"
}

variable "key_name" {
default = "salome"
}
variable "region" {
  type = string
  default = "eu-central-1"
}
