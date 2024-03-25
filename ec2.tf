provider "aws" {
  region  = var.region
}


resource "aws_instance" "web_server1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  security_groups = [aws_security_group.ec2_sgroup.name]
  key_name = var.key_name
  user_data = file("/home/ubuntu/userdata.sh")

    tags = {
    Name = "web_server1"
  }
}

resource "aws_instance" "web_server2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  security_groups = [aws_security_group.ec2_sgroup.name]
  key_name = var.key_name
  user_data = file("/home/ubuntu/userdata.sh")
 tags = {
    Name = "web_server2"
  }
}
