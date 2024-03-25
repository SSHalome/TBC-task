output "cloudfront-id" {
    value = aws_cloudfront_distribution.s3-distribution.id
}


output "security-group-id" {
    value = aws_security_group.ec2_sgroup.id
}

output "web-server-id" {
    value = aws_instance.web_server1.id
}

output "instance1_private_ip" {
  value = aws_instance.web_server1.private_ip
}

output "instance2_private_ip" {
  value = aws_instance.web_server2.private_ip

output "s3-bucket-id" {
    value = aws_s3_bucket.salome-tbc-terraform.id
}


output "Elastic-ip-id" {
    value = aws_eip.ec2_eip.id
}

output "allocation-id" {
    value = aws_eip.ec2_eip.id
}
