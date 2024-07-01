resource "aws_s3_bucket" "this" {
  bucket = "${var.project_name}-s3"

    tags = merge(
    var.tags,
    { Name = "${var.project_name}-s3" }
  )
}