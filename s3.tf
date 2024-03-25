resource "aws_s3_bucket" "salome-tbc-terraform" {
  bucket = "salome-tbc-terraform"
}

resource "aws_s3_bucket_policy" "bucket-cloudfront-access-policy" {
    bucket = aws_s3_bucket.salome-tbc-terraform.id

    policy = <<EOT
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "AllowCloudFrontServicePrincipal",
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "cloudfront.amazonaws.com"
                    },
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::salome-tbc-terraform/*",
                    "Condition": {
                        "StringEquals": {
                             "AWS:SourceArn": "${aws_cloudfront_distribution.s3-distribution.arn}"
                        }
                    }
                }
            ]
        }
    EOT
}


