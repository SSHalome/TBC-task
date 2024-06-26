resource "aws_cloudfront_origin_access_control" "cloudfront-s3-oac" {
  name                              = "cloudFront-s3-oac"
  description                       = "cloudfront S3 OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "s3-distribution" {
  origin {
    domain_name = aws_s3_bucket.salome-tbc-terraform.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.salome-tbc-terraform.id
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront-s3-oac.id
 }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Example CloudFront Distribution"

 default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.salome-tbc-terraform.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    } 

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

 restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["DE", "GE", "US", "CA"]
    }
  }

 viewer_certificate {
    cloudfront_default_certificate = true
  }
}
