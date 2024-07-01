resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# resource "aws_s3_bucket_object" "object" {
#   bucket = aws_s3_bucket.this.id
#   key          = "index.html"
#   source       = "${path.module}/index.html"

#   etag         = filemd5("${path.module}/index.html")
# }