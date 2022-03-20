resource "aws_s3_bucket" "mys3" {
  bucket = "aya-s3"
  tags = {
    Name = "Aya s3"
  }
}
resource "aws_s3_bucket_public_access_block" "myS3PublicAcc" {
  bucket = aws_s3_bucket.mys3.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_object" "myindex" {
  key                    = "index.html"
  bucket                 = aws_s3_bucket.mys3.id
  source                 = "/Users/ajbara/development/Terraform/index.html"
  server_side_encryption = "aws:kms"
}

