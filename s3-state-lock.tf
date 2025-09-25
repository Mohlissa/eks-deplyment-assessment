resource "aws_s3_bucket" "state-lock" {
  bucket = "molissa-state-lock-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_versioning" "versioning_state-lock" {
  bucket = aws_s3_bucket.state-lock.id
  versioning_configuration {
    status = "Enabled"
  }
}