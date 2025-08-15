resource "aws_s3_bucket" "xfusion-s3-32169" {
    bucket = "xfusion-s3-32169"
}

resource "aws_s3_bucket_ownership_controls" "s3_public_access" {
    bucket = aws_s3_bucket.xfusion-s3-32169.id
    
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "xfusion-s3-32169" {
    depends_on = [
        aws_s3_bucket_ownership_controls.s3_public_access,
        aws_s3_bucket_public_access_block.pub-access,
    ]
    bucket = aws_s3_bucket.xfusion-s3-32169.id
    acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "pub-access" {
    bucket = aws_s3_bucket.xfusion-s3-32169.id
    
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}