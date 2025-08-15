resource "aws_s3_bucket" "nautilus_s3_2089" {
  bucket = "my-tf-example-bucket"
}

resource "aws_s3_bucket_ownership_controls" "owner_control" {
  bucket = aws_s3_bucket.nautilus_s3_2089.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "owner_control" {
  depends_on = [aws_s3_bucket_ownership_controls.owner_control]

  bucket = aws_s3_bucket.nautilus_s3_2089.id
  acl    = "private"
}