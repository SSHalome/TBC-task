resource "aws_eip" "ec2_eip" {
  instance = aws_instance.web_server1.id

  tags = {
    Name = "Elastic_IP"
  }
}

# Associate Elastic IP with instance2
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web_server2.id
  allocation_id = aws_eip.ec2_eip.id
}
