resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = "${var.project_name}-s3"
  versioning_configuration {
    status = "Enabled"
  }
}