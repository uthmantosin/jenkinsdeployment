provider "aws" {
  region    = "us-east-1"
  profile   = "MENWITHTASTE"
}

resource "aws_s3_bucket" "example" {
  bucket = "mwtbucket"

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
