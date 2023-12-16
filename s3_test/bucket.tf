resource "aws_s3_bucket" "chord_s3_bucket" {
    bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_ownership_controls" "chord_s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.chord_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "chord_s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.chord_s3_bucket_ownership_controls]

  bucket = aws_s3_bucket.chord_s3_bucket.id
  acl    = "private"
}
