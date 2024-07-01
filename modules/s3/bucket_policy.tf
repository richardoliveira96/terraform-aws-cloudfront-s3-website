resource "aws_s3_bucket_policy" "logs_policy" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = [
          "s3:Put*",
          "s3:Get*",
        ]
        Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/*"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:*"
        Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/*"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action   = "s3:Get*"
        Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/*"
      },
      {
        Effect = "Allow"
        Principal = "*"
        Action   = "s3:*"
        Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "this" {
  depends_on = [aws_s3_bucket_ownership_controls.this]

  bucket = aws_s3_bucket.this.id
  acl    = "public-read"
}